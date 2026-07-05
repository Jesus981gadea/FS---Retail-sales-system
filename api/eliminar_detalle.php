<?php
header('Content-Type: application/json');
include('../conexion.php');
$d = json_decode(file_get_contents('php://input'),true);
$id_venta   = intval($d['id_venta']);
$id_producto= intval($d['id_producto']);
$f = mysqli_query($cn,"SELECT cantidad FROM detalle_venta WHERE id_venta=$id_venta AND id_producto=$id_producto");
$r = mysqli_fetch_assoc($f);
if ($r) {
    mysqli_query($cn,"UPDATE productos SET stock_actual=stock_actual+{$r['cantidad']} WHERE id_producto=$id_producto");
    mysqli_query($cn,"DELETE FROM detalle_venta WHERE id_venta=$id_venta AND id_producto=$id_producto");
    echo json_encode(['ok'=>true]);
} else {
    echo json_encode(['ok'=>false,'error'=>'No encontrado']);
}
