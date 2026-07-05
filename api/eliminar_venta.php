<?php
header('Content-Type: application/json');
include('../conexion.php');
$id = intval($_GET['id']);
$f = mysqli_query($cn,"SELECT id_producto,cantidad FROM detalle_venta WHERE id_venta=$id");
while($r=mysqli_fetch_assoc($f))
    mysqli_query($cn,"UPDATE productos SET stock_actual=stock_actual+{$r['cantidad']} WHERE id_producto={$r['id_producto']}");
mysqli_query($cn,"DELETE FROM detalle_venta WHERE id_venta=$id");
mysqli_query($cn,"DELETE FROM ventas WHERE id_venta=$id");
echo json_encode(['ok'=>true]);
