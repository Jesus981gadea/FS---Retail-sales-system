<?php
header('Content-Type: application/json');
include('../conexion.php');
$d = json_decode(file_get_contents('php://input'), true);

try {
    $fecha    = $d['fecha'] . ' ' . date('H:i:s');
    $nombre   = $d['nombre'] ?: null;
    $dni      = $d['dni']    ?: null;
    $ruc      = $d['ruc']    ?: null;
    $metodo   = $d['metodo'];
    $base     = floatval($d['base']);
    $desc     = floatval($d['descuento']);
    $igv      = floatval($d['igv']);
    $subtotal = floatval($d['subtotal']);
    $total    = floatval($d['total']);
    $id_empleado = !empty($d['id_empleado']) ? intval($d['id_empleado']) : null;

    $id_cliente = null;
    if ($nombre || $dni || $ruc) {
        mysqli_query($cn, "INSERT INTO clientes(nombre,dni,ruc) VALUES('$nombre','$dni',".($ruc ? "'$ruc'" : 'NULL').")");
        $id_cliente = mysqli_insert_id($cn);
    }

    mysqli_query($cn, "INSERT INTO ventas(fecha_venta,id_cliente,id_empleado,total_valor_venta,total_desc,total_igv,total_desc_sd,total,metodo_pago)
        VALUES('$fecha'," . ($id_cliente ?: 'NULL') . "," . ($id_empleado ?: 'NULL') . ",$base,$desc,$igv,$subtotal,$total,'$metodo')");
    $id_venta = mysqli_insert_id($cn);

    foreach ($d['items'] as $it) {
        $idp  = intval($it['id']);
        $cant = intval($it['cantidad']);
        $pu   = floatval($it['precio']);
        $sub  = floatval($it['importe']);
        $des  = floatval($it['descuento']);
        mysqli_query($cn, "INSERT INTO detalle_venta(id_venta,id_producto,cantidad,precio_unitario,subtotal,descuento_unitario)
            VALUES($id_venta,$idp,$cant,$pu,$sub,$des)");
        mysqli_query($cn, "UPDATE productos SET stock_actual=stock_actual-$cant WHERE id_producto=$idp");
    }

    echo json_encode(['ok'=>true, 'id_venta'=>$id_venta]);
} catch(Exception $e) {
    echo json_encode(['ok'=>false,'error'=>$e->getMessage()]);
}
