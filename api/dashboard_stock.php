<?php
header('Content-Type: application/json');
include('../conexion.php');

$id_cat = intval($_GET['id_categoria'] ?? 0);
$where  = $id_cat ? "WHERE p.id_categoria = $id_cat" : "";

$sql = "SELECT p.id_producto as id, p.nombre, p.stock_actual as stock, c.nombre as categoria
        FROM productos p
        LEFT JOIN categorias c ON p.id_categoria = c.id_categoria
        $where
        ORDER BY p.id_producto";

$f = mysqli_query($cn, $sql);
$out = [];
while ($r = mysqli_fetch_assoc($f)) $out[] = $r;
echo json_encode($out);
