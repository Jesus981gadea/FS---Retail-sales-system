<?php
header('Content-Type: application/json');
include('../conexion.php');
$fecha = mysqli_real_escape_string($cn, $_GET['fecha'] ?? date('Y-m-d'));
$f = mysqli_query($cn, "SELECT id_venta,total,total_desc,total_desc_sd,total_igv,metodo_pago FROM ventas WHERE DATE(fecha_venta)='$fecha' ORDER BY id_venta DESC");
$out=[];
while($r=mysqli_fetch_assoc($f)) $out[]=$r;
echo json_encode($out);
