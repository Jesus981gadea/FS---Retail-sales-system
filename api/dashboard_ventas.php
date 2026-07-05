<?php
header('Content-Type: application/json');
include('../conexion.php');

$periodo = $_GET['periodo'] ?? 'mes';
$fecha   = $_GET['fecha']   ?? date('Y-m-d');

function qval($cn, $sql) {
    $f = mysqli_query($cn, $sql);
    $r = mysqli_fetch_assoc($f);
    return $r ? floatval($r['t']) : 0;
}

$ref = new DateTime($fecha);
$hoy = new DateTime(date('Y-m-d'));
$labels = [];
$data   = [];

if ($periodo === 'dia') {
    // Ventas de ese día, desglosadas por hora
    $fecha_e = mysqli_real_escape_string($cn, $fecha);
    $f = mysqli_query($cn, "SELECT HOUR(fecha_venta) h, SUM(total) t FROM ventas WHERE DATE(fecha_venta)='$fecha_e' GROUP BY HOUR(fecha_venta)");
    $map = [];
    while ($r = mysqli_fetch_assoc($f)) $map[intval($r['h'])] = floatval($r['t']);
    for ($h = 0; $h < 24; $h++) {
        $labels[] = sprintf('%02d:00', $h);
        $data[]   = $map[$h] ?? 0;
    }

} elseif ($periodo === 'semana') {
    // Semana (Lunes a Domingo) que contiene la fecha de referencia
    $dow = intval($ref->format('N')); // 1=Lunes ... 7=Domingo
    $lunes = (clone $ref)->modify('-' . ($dow - 1) . ' days');
    $dias = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
    for ($i = 0; $i < 7; $i++) {
        $d = (clone $lunes)->modify("+$i days");
        $labels[] = $dias[$i] . ' ' . $d->format('d/m');
        if ($d > $hoy) { $data[] = 0; continue; }
        $fstr = $d->format('Y-m-d');
        $data[] = qval($cn, "SELECT SUM(total) t FROM ventas WHERE DATE(fecha_venta)='$fstr'");
    }

} elseif ($periodo === 'mes') {
    // Todos los días del mes de la fecha de referencia
    $anio = $ref->format('Y'); $mes = $ref->format('m');
    $dias_mes = intval($ref->format('t'));
    for ($d = 1; $d <= $dias_mes; $d++) {
        $fecha_d = sprintf('%s-%s-%02d', $anio, $mes, $d);
        $labels[] = $d;
        if ((new DateTime($fecha_d)) > $hoy) { $data[] = 0; continue; }
        $data[] = qval($cn, "SELECT SUM(total) t FROM ventas WHERE DATE(fecha_venta)='$fecha_d'");
    }

} else {
    // bimestre (2 meses), trimestre (3 meses) o año (12 meses) -> agrupado por mes
    $meses_cant = ['bimestre' => 2, 'trimestre' => 3, 'anio' => 12][$periodo] ?? 12;
    $nombres = ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'];
    $anio_ref = intval($ref->format('Y'));
    $mes_ref  = intval($ref->format('m'));

    if ($meses_cant == 12) {
        // Año calendario completo del año de referencia
        $inicio_mes = 1; $inicio_anio = $anio_ref;
    } else {
        // Ventana de N meses terminando en el mes de referencia
        $inicio_mes = $mes_ref - ($meses_cant - 1);
        $inicio_anio = $anio_ref;
        while ($inicio_mes <= 0) { $inicio_mes += 12; $inicio_anio--; }
    }

    for ($i = 0; $i < $meses_cant; $i++) {
        $m = $inicio_mes + $i; $a = $inicio_anio;
        while ($m > 12) { $m -= 12; $a++; }
        $labels[] = $nombres[$m - 1] . ' ' . $a;

        $inicio_str = sprintf('%d-%02d-01', $a, $m);
        $dtInicio = new DateTime($inicio_str);
        if ($dtInicio > $hoy) { $data[] = 0; continue; }
        $fin_str = (clone $dtInicio)->modify('last day of this month')->format('Y-m-d');
        $data[] = qval($cn, "SELECT SUM(total) t FROM ventas WHERE fecha_venta BETWEEN '$inicio_str 00:00:00' AND '$fin_str 23:59:59'");
    }
}

echo json_encode(['labels' => $labels, 'data' => $data]);
