<?php
header('Content-Type: application/json');
include('../conexion.php');
$d = json_decode(file_get_contents('php://input'),true);
$nombre = mysqli_real_escape_string($cn,$d['nombre']);
$ruc    = mysqli_real_escape_string($cn,$d['ruc']);
$tel    = mysqli_real_escape_string($cn,$d['tel']);
$dir    = mysqli_real_escape_string($cn,$d['dir']);
mysqli_query($cn,"INSERT INTO proveedores(nombre_empresa,ruc,telefono,direccion) VALUES('$nombre','$ruc','$tel','$dir')");
echo json_encode(['ok'=>true,'id'=>mysqli_insert_id($cn)]);
