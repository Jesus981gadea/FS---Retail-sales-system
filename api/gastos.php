<?php
header('Content-Type: application/json');
include('../conexion.php');
$fecha = mysqli_real_escape_string($cn, $_GET['fecha'] ?? date('Y-m-d'));
$f = mysqli_query($cn, "SELECT id_gastos as id, tipo_gasto as tipo, cantidad FROM gastos WHERE DATE(fecha)='$fecha' ORDER BY id_gastos DESC");
$out = [];
while($r=mysqli_fetch_assoc($f)) $out[]=$r;
echo json_encode($out);
