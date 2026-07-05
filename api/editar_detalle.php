<?php
header('Content-Type: application/json');
include('../conexion.php');

$d = json_decode(file_get_contents('php://input'), true);
$id_venta       = intval($d['id_venta'] ?? 0);
$id_producto    = intval($d['id_producto'] ?? 0);
$nueva_cantidad = intval($d['cantidad'] ?? 0);

if (!$id_venta || !$id_producto) {
    echo json_encode(['ok' => false, 'error' => 'Datos incompletos.']);
    exit;
}

if ($nueva_cantidad <= 0) {
    echo json_encode(['ok' => false, 'error' => 'La cantidad debe ser mayor a 0. Si deseas quitar el producto, elimínalo con el botón de eliminar ítem.']);
    exit;
}

$f = mysqli_query($cn, "SELECT cantidad, precio_unitario FROM detalle_venta WHERE id_venta=$id_venta AND id_producto=$id_producto");
$row = mysqli_fetch_assoc($f);
if (!$row) {
    echo json_encode(['ok' => false, 'error' => 'Ítem no encontrado en esta venta.']);
    exit;
}

$cantidad_anterior = intval($row['cantidad']);
$precio_unitario    = floatval($row['precio_unitario']);
$diferencia         = $cantidad_anterior - $nueva_cantidad; // positivo = se devuelve stock, negativo = se resta más stock

// Si se aumenta la cantidad, validar que haya stock suficiente
if ($diferencia < 0) {
    $fs = mysqli_query($cn, "SELECT stock_actual FROM productos WHERE id_producto=$id_producto");
    $rs = mysqli_fetch_assoc($fs);
    if (!$rs || intval($rs['stock_actual']) < abs($diferencia)) {
        echo json_encode(['ok' => false, 'error' => 'No hay stock suficiente para aumentar la cantidad a ' . $nueva_cantidad . '.']);
        exit;
    }
}

$nuevo_subtotal = round($precio_unitario * $nueva_cantidad, 2);

mysqli_query($cn, "UPDATE detalle_venta SET cantidad=$nueva_cantidad, subtotal=$nuevo_subtotal WHERE id_venta=$id_venta AND id_producto=$id_producto");
mysqli_query($cn, "UPDATE productos SET stock_actual = stock_actual + ($diferencia) WHERE id_producto=$id_producto");

// Recalcular los totales de la venta a partir de todos sus ítems actuales
$ft = mysqli_query($cn, "SELECT SUM(subtotal) as totalImporte, SUM(descuento_unitario) as totalDesc FROM detalle_venta WHERE id_venta=$id_venta");
$t = mysqli_fetch_assoc($ft);
$totalImporte = floatval($t['totalImporte']);
$totalDesc    = floatval($t['totalDesc']);
$neto = round($totalImporte - $totalDesc, 2);
$base = round($neto / 1.18, 2);
$igv  = round($neto - $base, 2);

mysqli_query($cn, "UPDATE ventas SET total_valor_venta=$base, total_desc=$totalDesc, total_igv=$igv, total_desc_sd=$totalImporte, total=$neto WHERE id_venta=$id_venta");

echo json_encode([
    'ok' => true,
    'nuevo_subtotal' => $nuevo_subtotal,
    'total_venta' => $neto
]);
