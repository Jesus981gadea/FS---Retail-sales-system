<?php
include('../conexion.php');
$id = intval($_GET['id']);
$fv = mysqli_query($cn,"SELECT v.*, c.nombre as cli_nombre, c.dni, c.ruc FROM ventas v LEFT JOIN clientes c ON v.id_cliente=c.id_cliente WHERE v.id_venta=$id");
$v  = mysqli_fetch_assoc($fv);
$fd = mysqli_query($cn,"SELECT d.*,p.nombre as prod_nombre FROM detalle_venta d JOIN productos p ON d.id_producto=p.id_producto WHERE d.id_venta=$id");
header('Content-Type: text/html; charset=utf-8');
echo "<html><head><meta charset='utf-8'><title>Comprobante #$id</title>";
echo "<style>body{font-family:Arial;padding:20px;max-width:600px;margin:auto;} table{border-collapse:collapse;width:100%;} th,td{border:1px solid #ccc;padding:7px;} th{background:#1a3460;color:#fff;} .total{font-size:16px;font-weight:bold;} @media print{.no-print{display:none;}}</style></head><body>";
echo "<h2 style='text-align:center;'>COMPROBANTE DE VENTA #$id</h2>";
echo "<p><b>Cliente:</b> {$v['cli_nombre']} &nbsp; <b>DNI:</b> {$v['dni']} &nbsp; <b>Fecha:</b> {$v['fecha_venta']}</p>";
echo "<p><b>Método de pago:</b> {$v['metodo_pago']}</p>";
echo "<table><tr><th>Producto</th><th>Cant.</th><th>P.Unit</th><th>Subtotal</th><th>Desc.</th></tr>";
while($d=mysqli_fetch_assoc($fd)) echo "<tr><td>{$d['prod_nombre']}</td><td>{$d['cantidad']}</td><td>S/ ".number_format($d['precio_unitario'],2)."</td><td>S/ ".number_format($d['subtotal'],2)."</td><td>S/ ".number_format($d['descuento_unitario']??0,2)."</td></tr>";
echo "</table><br><table><tr><td>Descuento:</td><td>S/ ".number_format($v['total_desc'],2)."</td></tr><tr><td>IGV (18%):</td><td>S/ ".number_format($v['total_igv'],2)."</td></tr><tr class='total'><td>TOTAL:</td><td>S/ ".number_format($v['total'],2)."</td></tr></table>";
echo "<br><button class='no-print' onclick='window.print()'>🖨 Imprimir</button></body></html>";
