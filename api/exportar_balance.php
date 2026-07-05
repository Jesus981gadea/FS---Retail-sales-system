<?php
include('../conexion.php');
$fecha = mysqli_real_escape_string($cn, $_GET['fecha'] ?? date('Y-m-d'));
// Balance
$f = mysqli_query($cn,"SELECT SUM(CASE WHEN metodo_pago='Efectivo' THEN total ELSE 0 END) as ef,
    SUM(CASE WHEN metodo_pago='Yape' THEN total ELSE 0 END) as yp,
    SUM(CASE WHEN metodo_pago='Plin' THEN total ELSE 0 END) as pl,
    SUM(CASE WHEN metodo_pago='Tarjeta' THEN total ELSE 0 END) as tr,
    SUM(total) as vt FROM ventas WHERE DATE(fecha_venta)='$fecha'");
$v = mysqli_fetch_assoc($f);
$fg = mysqli_query($cn,"SELECT SUM(cantidad) as g FROM gastos WHERE DATE(fecha)='$fecha'");
$g  = mysqli_fetch_assoc($fg);
$gastos = floatval($g['g']);

header('Content-Type: text/html; charset=utf-8');
echo "<html><head><meta charset='utf-8'><title>Balance $fecha</title>";
echo "<style>body{font-family:Arial;padding:20px;} table{border-collapse:collapse;width:100%;} th,td{border:1px solid #ccc;padding:8px;} th{background:#1a3460;color:#fff;}</style></head><body>";
echo "<h2>Balance del Día: $fecha</h2>";
echo "<table><tr><th>Efectivo</th><th>Yape</th><th>Plin</th><th>Tarjeta</th><th>Venta Total</th><th>Gastos</th><th>Neto</th></tr>";
echo "<tr><td>S/ ".number_format($v['ef'],2)."</td><td>S/ ".number_format($v['yp'],2)."</td><td>S/ ".number_format($v['pl'],2)."</td><td>S/ ".number_format($v['tr'],2)."</td><td>S/ ".number_format($v['vt'],2)."</td><td>S/ ".number_format($gastos,2)."</td><td>S/ ".number_format(floatval($v['ef'])-$gastos,2)."</td></tr></table>";
$fv = mysqli_query($cn,"SELECT id_venta,metodo_pago,total FROM ventas WHERE DATE(fecha_venta)='$fecha'");
echo "<h3>Ventas del día</h3><table><tr><th>ID</th><th>Método</th><th>Total</th></tr>";
while($r=mysqli_fetch_assoc($fv)) echo "<tr><td>{$r['id_venta']}</td><td>{$r['metodo_pago']}</td><td>S/ ".number_format($r['total'],2)."</td></tr>";
echo "</table>";
$fgas = mysqli_query($cn,"SELECT tipo_gasto,cantidad FROM gastos WHERE DATE(fecha)='$fecha'");
echo "<h3>Gastos del día</h3><table><tr><th>Tipo</th><th>Monto</th></tr>";
while($r=mysqli_fetch_assoc($fgas)) echo "<tr><td>{$r['tipo_gasto']}</td><td>S/ ".number_format($r['cantidad'],2)."</td></tr>";
echo "</table></body></html>";
