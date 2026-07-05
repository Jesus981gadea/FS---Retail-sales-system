<?php
header('Content-Type: application/json');
include('../conexion.php');
$d = json_decode(file_get_contents('php://input'), true);

try {
    $fecha      = $d['fecha'];
    $id_prov    = $d['id_proveedor'] ? intval($d['id_proveedor']) : 'NULL';
    $total      = array_sum(array_column($d['items'], 'subtotal'));

    mysqli_query($cn, "INSERT INTO compras(fecha_compra,id_proveedor,total) VALUES('$fecha',$id_prov,$total)");
    $id_compra = mysqli_insert_id($cn);

    foreach ($d['items'] as $it) {
        $idp   = intval($it['id']);
        $cant  = intval($it['cantidad']);
        $costo = floatval($it['costo']);
        $sub   = floatval($it['subtotal']);
        $pv    = floatval($it['precio_venta']);
        mysqli_query($cn, "INSERT INTO detalle_compra(id_compra,id_producto,cantidad,precio_compra,subtotal)
            VALUES($id_compra,$idp,$cant,$costo,$sub)");
        mysqli_query($cn, "UPDATE productos SET stock_actual=stock_actual+$cant, precio_unitario=$pv WHERE id_producto=$idp");
    }

    echo json_encode(['ok'=>true,'id_compra'=>$id_compra]);
} catch(Exception $e) {
    echo json_encode(['ok'=>false,'error'=>$e->getMessage()]);
}
