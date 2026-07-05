<?php
header('Content-Type: application/json');
include('../conexion.php');

$fecha = mysqli_real_escape_string($cn, $_GET['fecha'] ?? date('Y-m-d'));

$f = mysqli_query($cn, "SELECT id_venta, TIME_FORMAT(fecha_venta, '%H:%i') as hora, total
        FROM ventas
        WHERE DATE(fecha_venta)='$fecha'
        ORDER BY fecha_venta ASC");

$out = [];
while ($r = mysqli_fetch_assoc($f)) $out[] = $r;
echo json_encode($out);
