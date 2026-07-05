<?php
header('Content-Type: application/json');
include('../conexion.php');
$d = json_decode(file_get_contents('php://input'), true);
$tipo     = mysqli_real_escape_string($cn, $d['tipo']);
$cantidad = floatval($d['cantidad']);
$fecha    = $d['fecha'] . ' 00:00:00';
mysqli_query($cn, "INSERT INTO gastos(fecha,tipo_gasto,cantidad) VALUES('$fecha','$tipo',$cantidad)");
echo json_encode(['ok'=>true, 'id'=>mysqli_insert_id($cn)]);
