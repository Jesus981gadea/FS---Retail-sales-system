<?php
header('Content-Type: application/json');
include('../conexion.php');

$periodo = $_GET['periodo'] ?? 'mes';
$fecha   = $_GET['fecha']   ?? date('Y-m-d');
$ref = new DateTime($fecha);

if ($periodo === 'dia') {
    $ini = $fecha . ' 00:00:00';
    $fin = $fecha . ' 23:59:59';
} elseif ($periodo === 'semana') {
    $dow = intval($ref->format('N'));
    $lunes   = (clone $ref)->modify('-' . ($dow - 1) . ' days');
    $domingo = (clone $lunes)->modify('+6 days');
    $ini = $lunes->format('Y-m-d') . ' 00:00:00';
    $fin = $domingo->format('Y-m-d') . ' 23:59:59';
} else { // mes
    $ini = $ref->format('Y-m') . '-01 00:00:00';
    $fin = (clone $ref)->modify('last day of this month')->format('Y-m-d') . ' 23:59:59';
}

$ini_e = mysqli_real_escape_string($cn, $ini);
$fin_e = mysqli_real_escape_string($cn, $fin);

$sql = "SELECT c.nombre as categoria, SUM(dv.cantidad) as unidades, SUM(dv.subtotal) as monto
        FROM detalle_venta dv
        JOIN productos p  ON dv.id_producto = p.id_producto
        JOIN categorias c ON p.id_categoria = c.id_categoria
        JOIN ventas v     ON dv.id_venta = v.id_venta
        WHERE v.fecha_venta BETWEEN '$ini_e' AND '$fin_e'
        GROUP BY c.id_categoria
        ORDER BY monto DESC";

$f = mysqli_query($cn, $sql);
$out = [];
while ($r = mysqli_fetch_assoc($f)) $out[] = $r;
echo json_encode($out);
