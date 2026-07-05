<?php
header('Content-Type: application/json');
include('../conexion.php');
$d = json_decode(file_get_contents('php://input'),true);
$nombre = mysqli_real_escape_string($cn,$d['nombre']);
$id_cat = $d['id_categoria'] ? intval($d['id_categoria']) : 'NULL';
mysqli_query($cn,"INSERT INTO productos(nombre,id_categoria,stock_actual,precio_unitario) VALUES('$nombre',$id_cat,0,0.00)");
echo json_encode(['ok'=>true,'id'=>mysqli_insert_id($cn)]);
