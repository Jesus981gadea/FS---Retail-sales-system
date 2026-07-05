<?php
header('Content-Type: application/json');
include('../conexion.php');
$f = mysqli_query($cn, "SELECT id_empleado as id, nombre, cargo FROM empleados ORDER BY nombre");
$out = [];
while ($r = mysqli_fetch_assoc($f)) $out[] = $r;
echo json_encode($out);
