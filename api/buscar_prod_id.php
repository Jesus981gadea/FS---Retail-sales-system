<?php
header('Content-Type: application/json');
include('../conexion.php');
$id = intval($_GET['id'] ?? 0);
$f = mysqli_query($cn,"SELECT id_producto as id, nombre, precio_unitario as precio, stock_actual as stock FROM productos WHERE id_producto=$id");
$r = mysqli_fetch_assoc($f);
echo json_encode($r ?: []);
