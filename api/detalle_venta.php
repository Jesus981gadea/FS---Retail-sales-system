<?php
header('Content-Type: application/json');
include('../conexion.php');
$id = intval($_GET['id']);
$f = mysqli_query($cn,"SELECT d.id_producto,p.nombre,d.cantidad,d.precio_unitario,d.subtotal,d.descuento_unitario FROM detalle_venta d JOIN productos p ON d.id_producto=p.id_producto WHERE d.id_venta=$id");
$out=[];
while($r=mysqli_fetch_assoc($f)) $out[]=$r;
echo json_encode($out);
