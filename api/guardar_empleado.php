<?php
header('Content-Type: application/json');
include('../conexion.php');
$d = json_decode(file_get_contents('php://input'), true);
$nombre = trim($d['nombre'] ?? '');

if (!$nombre) {
    echo json_encode(['ok' => false, 'error' => 'El nombre es obligatorio.']);
    exit;
}

$nombre_e = mysqli_real_escape_string($cn, $nombre);
mysqli_query($cn, "INSERT INTO empleados(nombre) VALUES('$nombre_e')");
$id = mysqli_insert_id($cn);

echo json_encode(['ok' => true, 'id' => $id, 'nombre' => $nombre]);
