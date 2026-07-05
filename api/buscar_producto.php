<?php
header('Content-Type: application/json');
include('../conexion.php');
$q = '%' . mysqli_real_escape_string($cn, $_GET['q'] ?? '') . '%';
$sql = "SELECT p.id_producto as id, p.nombre, p.precio_unitario as precio, p.stock_actual as stock,
        IFNULL(dc.precio_compra,0) as costo
        FROM productos p
        LEFT JOIN (
            SELECT id_producto, precio_compra FROM detalle_compra
            WHERE (id_producto, id_compra) IN (
                SELECT id_producto, MAX(id_compra) FROM detalle_compra GROUP BY id_producto
            )
        ) dc ON p.id_producto=dc.id_producto
        WHERE p.nombre LIKE '$q' LIMIT 10";
$f = mysqli_query($cn,$sql);
$out = [];
while($r=mysqli_fetch_assoc($f)) $out[]=$r;
echo json_encode($out);
