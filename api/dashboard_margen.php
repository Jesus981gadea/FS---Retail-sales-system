<?php
header('Content-Type: application/json');
include('../conexion.php');

$periodo = $_GET['periodo'] ?? 'mes';
$fecha   = $_GET['fecha']   ?? date('Y-m-d');

function calcularRangoPeriodo($periodo, $fecha) {
    $ref = new DateTime($fecha);

    if ($periodo === 'dia') {
        $ini = $fecha . ' 00:00:00';
        $fin = $fecha . ' 23:59:59';

    } elseif ($periodo === 'semana') {
        $dow = intval($ref->format('N')); // 1=Lunes ... 7=Domingo
        $lunes   = (clone $ref)->modify('-' . ($dow - 1) . ' days');
        $domingo = (clone $lunes)->modify('+6 days');
        $ini = $lunes->format('Y-m-d') . ' 00:00:00';
        $fin = $domingo->format('Y-m-d') . ' 23:59:59';

    } elseif ($periodo === 'mes') {
        $ini = $ref->format('Y-m') . '-01 00:00:00';
        $fin = (clone $ref)->modify('last day of this month')->format('Y-m-d') . ' 23:59:59';

    } else {
        // bimestre (2 meses), trimestre (3 meses) o año (12 meses)
        $meses_cant = ['bimestre' => 2, 'trimestre' => 3, 'anio' => 12][$periodo] ?? 1;
        $anio_ref = intval($ref->format('Y'));
        $mes_ref  = intval($ref->format('m'));

        if ($meses_cant == 12) {
            $inicio_mes = 1; $inicio_anio = $anio_ref;
            $fin_mes = 12; $fin_anio = $anio_ref;
        } else {
            $inicio_mes = $mes_ref - ($meses_cant - 1);
            $inicio_anio = $anio_ref;
            while ($inicio_mes <= 0) { $inicio_mes += 12; $inicio_anio--; }
            $fin_mes = $mes_ref; $fin_anio = $anio_ref;
        }

        $ini = sprintf('%d-%02d-01 00:00:00', $inicio_anio, $inicio_mes);
        $dtFin = new DateTime(sprintf('%d-%02d-01', $fin_anio, $fin_mes));
        $fin = $dtFin->modify('last day of this month')->format('Y-m-d') . ' 23:59:59';
    }

    return [$ini, $fin];
}

list($ini, $fin) = calcularRangoPeriodo($periodo, $fecha);
$ini_e = mysqli_real_escape_string($cn, $ini);
$fin_e = mysqli_real_escape_string($cn, $fin);

// Costo estimado como % del precio de venta (simulado: no existe columna de costo real en el catálogo)
$FACTOR_COSTO = 0.65;

// Categorías (todas)
$categorias = [];
$fc = mysqli_query($cn, "SELECT id_categoria, nombre FROM categorias ORDER BY nombre");
while ($c = mysqli_fetch_assoc($fc)) {
    $categorias[$c['id_categoria']] = ['id_categoria' => $c['id_categoria'], 'categoria' => $c['nombre'], 'productos' => []];
}

// Catálogo completo de productos
$fp = mysqli_query($cn, "SELECT id_producto, nombre, precio_unitario, stock_actual, id_categoria FROM productos");
$productos = [];
while ($p = mysqli_fetch_assoc($fp)) $productos[$p['id_producto']] = $p;

// Ventas reales agregadas por producto dentro del rango del periodo
$ventasProd = [];
$fv = mysqli_query($cn, "SELECT dv.id_producto, SUM(dv.cantidad) uds, SUM(dv.subtotal) monto
        FROM detalle_venta dv
        JOIN ventas v ON dv.id_venta = v.id_venta
        WHERE v.fecha_venta BETWEEN '$ini_e' AND '$fin_e'
        GROUP BY dv.id_producto");
while ($r = mysqli_fetch_assoc($fv)) $ventasProd[$r['id_producto']] = $r;

foreach ($productos as $idp => $p) {
    $idc = $p['id_categoria'];
    if (!isset($categorias[$idc])) continue;

    $uds = 0; $monto = 0;
    if (isset($ventasProd[$idp])) {
        $uds   = intval($ventasProd[$idp]['uds']);
        $monto = floatval($ventasProd[$idp]['monto']);
    }

    $costo_unit = round(floatval($p['precio_unitario']) * $FACTOR_COSTO, 2);
    $costos = round($costo_unit * $uds, 2);
    $margen = round($monto - $costos, 2);
    $margen_pct = $monto > 0 ? round($margen / $monto * 100, 1) : 0;
    $stock = intval($p['stock_actual']);
    $pct_vendido = $stock > 0 ? round($uds / $stock * 100, 1) : ($uds > 0 ? 100 : 0);

    $categorias[$idc]['productos'][] = [
        'id' => $idp,
        'nombre' => $p['nombre'],
        'costos' => $costos,
        'ventas' => $monto,
        'margen' => $margen,
        'margen_pct' => $margen_pct,
        'unidades' => $uds,
        'stock' => $stock,
        'pct_vendido' => $pct_vendido
    ];
}

$out = [];
foreach ($categorias as $cat) {
    $costos = 0; $ventas = 0; $unidades = 0; $stockTotal = 0; $unicos = 0;
    $general = count($cat['productos']);

    foreach ($cat['productos'] as $p) {
        $costos += $p['costos']; $ventas += $p['ventas']; $unidades += $p['unidades'];
        $stockTotal += $p['stock'];
        if ($p['unidades'] > 0) $unicos++;
    }

    $margen = round($ventas - $costos, 2);
    $margen_pct = $ventas > 0 ? round($margen / $ventas * 100, 1) : 0;
    $pct_vendido = $stockTotal > 0 ? round($unidades / $stockTotal * 100, 1) : ($unidades > 0 ? 100 : 0);
    $unicos_pct = $general > 0 ? round($unicos / $general * 100, 1) : 0;

    $out[] = [
        'id_categoria' => $cat['id_categoria'],
        'categoria' => $cat['categoria'],
        'costos' => round($costos, 2),
        'ventas' => round($ventas, 2),
        'margen' => $margen,
        'margen_pct' => $margen_pct,
        'unidades' => $unidades,
        'pct_vendido' => $pct_vendido,
        'unicos' => $unicos,
        'general' => $general,
        'unicos_pct' => $unicos_pct,
        'productos' => $cat['productos']
    ];
}

// Ordenar categorías de mayor a menor venta para que lo más relevante aparezca primero
usort($out, function($a, $b) { return $b['ventas'] <=> $a['ventas']; });

echo json_encode(['rango' => ['ini' => $ini, 'fin' => $fin], 'categorias' => $out]);
