<?php
header('Content-Type: application/json');
include('../conexion.php');
$fecha = mysqli_real_escape_string($cn, $_GET['fecha'] ?? date('Y-m-d'));

// Ventas por metodo
$f = mysqli_query($cn, "SELECT
    SUM(CASE WHEN metodo_pago='Efectivo' THEN total ELSE 0 END) as efectivo,
    SUM(CASE WHEN metodo_pago='Yape'     THEN total ELSE 0 END) as yape,
    SUM(CASE WHEN metodo_pago='Plin'     THEN total ELSE 0 END) as plin,
    SUM(CASE WHEN metodo_pago='Tarjeta'  THEN total ELSE 0 END) as tarjeta,
    SUM(total) as venta_total
    FROM ventas WHERE DATE(fecha_venta)='$fecha'");
$v = mysqli_fetch_assoc($f);

// Gastos
$fg = mysqli_query($cn, "SELECT SUM(cantidad) as total_gastos FROM gastos WHERE DATE(fecha)='$fecha'");
$g  = mysqli_fetch_assoc($fg);
$gastos = floatval($g['total_gastos']);

$efectivo_neto = floatval($v['efectivo']) - $gastos;

echo json_encode([
    'efectivo'     => $v['efectivo'] ?? 0,
    'yape'         => $v['yape'] ?? 0,
    'plin'         => $v['plin'] ?? 0,
    'tarjeta'      => $v['tarjeta'] ?? 0,
    'venta_total'  => $v['venta_total'] ?? 0,
    'total_gastos' => $gastos,
    'efectivo_neto'=> $efectivo_neto
]);
