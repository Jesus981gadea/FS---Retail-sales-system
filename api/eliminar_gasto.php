<?php
header('Content-Type: application/json');
include('../conexion.php');
$id = intval($_GET['id']);
mysqli_query($cn, "DELETE FROM gastos WHERE id_gastos=$id");
echo json_encode(['ok'=>true]);
