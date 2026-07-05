<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ferretería - Sistema de Registros</title>
    <link rel="stylesheet" href="css/estilo.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.4/dist/chart.umd.min.js"></script>
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">🔧 Ferretería <span>System</span></div>
    <nav>
        <button class="nav-btn active" onclick="showSection('ventas')">🛒 Ventas</button>
        <button class="nav-btn" onclick="showSection('compras')">📦 Compras</button>
        <button class="nav-btn" onclick="showSection('gastos')">💸 Gastos</button>
        <button class="nav-btn" onclick="showSection('balance')">📊 Balance</button>
        <button class="nav-btn" onclick="showSection('historial')">📋 Historial</button>
        <button class="nav-btn" onclick="showSection('dashboard')">📈 Dashboard</button>
    </nav>
</div>

<div class="main">

<!-- DATE BAR -->
<div class="datebar">
    <label>📅 Fecha de operación:</label>
    <input type="date" id="fecha_global" value="<?php echo date('Y-m-d'); ?>">
    <button class="btn btn-blue btn-sm" onclick="actualizarTodo()">🔄 Actualizar</button>
    <span id="lbl_fecha_texto" style="color:#4ecca3; font-weight:700; margin-left:10px;"></span>

    <span class="empleado-badge" id="empleado_actual">👤 Sin empleado</span>
    <button class="btn btn-orange btn-sm" onclick="document.getElementById('modal-empleado').classList.add('active')">🔄 Cambiar empleado</button>
</div>

<!-- ============================================================ -->
<!-- SECCIÓN VENTAS                                                -->
<!-- ============================================================ -->
<div id="sec-ventas" class="section">

    <!-- Fila superior: datos cliente + resumen -->
    <div style="display:grid; grid-template-columns:1fr 360px; gap:16px; margin-bottom:16px;">

        <!-- Card cliente + productos -->
        <div class="card">
            <div class="card-header">
                <span class="card-title">🛒 Registro de Venta</span>
                <button class="btn btn-blue btn-sm" onclick="limpiarVenta()">✖ Limpiar</button>
            </div>

            <!-- Datos del cliente -->
            <div class="form-row">
                <div class="form-group" style="flex:2;">
                    <label>Nombre Cliente</label>
                    <input type="text" id="cli_nombre" placeholder="Nombre del cliente" autocomplete="off">
                </div>
                <div class="form-group">
                    <label>DNI</label>
                    <input type="text" id="cli_dni" maxlength="8" placeholder="DNI">
                </div>
                <div class="form-group">
                    <label>RUC</label>
                    <input type="text" id="cli_ruc" maxlength="11" placeholder="RUC">
                </div>
                <div class="form-group">
                    <label>Método Pago</label>
                    <select id="metodo_pago">
                        <option>Efectivo</option>
                        <option>Yape</option>
                        <option>Plin</option>
                        <option>Tarjeta</option>
                    </select>
                </div>
            </div>

            <!-- Búsqueda de producto -->
            <div class="form-row" style="position:relative;">
                <div class="form-group" style="flex:0 0 90px;">
                    <label>Cantidad</label>
                    <input type="number" id="v_cantidad" value="1" min="1">
                </div>
                <div class="form-group" style="flex:2;">
                    <label>Buscar Producto</label>
                    <input type="text" id="v_buscar" placeholder="Escriba el nombre del producto..." autocomplete="off"
                           oninput="buscarProducto(this.value)" onblur="setTimeout(()=>ocultarAC(),200)">
                </div>
                <div class="form-group" style="flex:0 0 100px;">
                    <label>Descuento S/</label>
                    <input type="number" id="v_descuento" value="0" min="0" step="0.01">
                </div>
                <div class="form-group" style="flex:0 0 90px; justify-content:flex-end;">
                    <label>&nbsp;</label>
                    <button class="btn btn-green" onclick="agregarProductoManual()">+ Agregar</button>
                </div>
            </div>

            <!-- Tabla de ítems de venta -->
            <div class="tbl-wrap" style="max-height:240px; overflow-y:auto;">
                <table class="data-table" id="tbl_venta">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Cant.</th>
                            <th>P.Unit</th>
                            <th>Importe</th>
                            <th>Desc.</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="tbl_venta_body"></tbody>
                </table>
            </div>

            <!-- Botones -->
            <div style="display:flex; gap:10px; margin-top:14px;">
                <button class="btn btn-red" onclick="eliminarFilaVenta()">🗑 Eliminar ítem</button>
                <button class="btn btn-green" style="flex:1;" onclick="abrirModalGuardarVenta()">💾 Guardar Venta</button>
            </div>
        </div>

        <!-- Resumen -->
        <div class="card">
            <div class="card-header">
                <span class="card-title">📊 Resumen</span>
            </div>
            <div class="resumen-grid">
                <div class="res-item"><span class="res-label">Venta Total</span><span class="res-value" id="r_base">S/ 0.00</span></div>
                <div class="res-item"><span class="res-label">Descuento</span><span class="res-value red" id="r_desc">S/ 0.00</span></div>
                <div class="res-item"><span class="res-label">IGV (18%)</span><span class="res-value yellow" id="r_igv">S/ 0.00</span></div>
                <div class="res-item"><span class="res-label">Sub-Total</span><span class="res-value" id="r_sub">S/ 0.00</span></div>
                <div class="res-item total"><span class="res-label" style="font-size:14px; font-weight:700;">IMPORTE TOTAL</span><span class="res-value" id="r_total" style="font-size:18px;">S/ 0.00</span></div>
            </div>
        </div>
    </div>
</div>

<!-- ============================================================ -->
<!-- SECCIÓN COMPRAS                                               -->
<!-- ============================================================ -->
<div id="sec-compras" class="section" style="display:none;">
    <div class="card">
        <div class="card-header">
            <span class="card-title">📦 Registro de Compra</span>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label>Fecha Compra</label>
                <input type="date" id="c_fecha" value="<?php echo date('Y-m-d'); ?>">
            </div>
            <div class="form-group" style="flex:2;">
                <label>Proveedor</label>
                <select id="c_proveedor">
                    <option value="">-- Seleccionar --</option>
                    <?php
                    include("conexion.php");
                    $rp = mysqli_query($cn, "SELECT id_proveedor, nombre_empresa FROM proveedores ORDER BY nombre_empresa");
                    while ($p = mysqli_fetch_assoc($rp)) {
                        echo "<option value='{$p['id_proveedor']}'>{$p['nombre_empresa']}</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group" style="flex:0 0 auto; justify-content:flex-end;">
                <label>&nbsp;</label>
                <button class="btn btn-blue btn-sm" onclick="document.getElementById('modal-proveedor').classList.add('active')">+ Proveedor</button>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group" style="flex:0 0 100px;">
                <label>ID Producto</label>
                <input type="number" id="c_idprod" placeholder="ID">
            </div>
            <div class="form-group" style="flex:0 0 100px;">
                <label>Cantidad</label>
                <input type="number" id="c_cantidad" value="1" min="1">
            </div>
            <div class="form-group" style="flex:0 0 120px;">
                <label>Costo/Unid S/</label>
                <input type="number" id="c_costo" step="0.01" placeholder="0.00">
            </div>
            <div class="form-group" style="flex:0 0 auto; justify-content:flex-end;">
                <label>&nbsp;</label>
                <button class="btn btn-green" onclick="agregarItemCompra()">+ Agregar</button>
            </div>
            <div class="form-group" style="flex:0 0 auto; justify-content:flex-end;">
                <label>&nbsp;</label>
                <button class="btn btn-blue btn-sm" onclick="document.getElementById('modal-producto').classList.add('active')">+ Producto nuevo</button>
            </div>
        </div>

        <div class="tbl-wrap" style="max-height:220px; overflow-y:auto;">
            <table class="data-table">
                <thead><tr><th>ID</th><th>Nombre</th><th>Cant.</th><th>Costo/Unid</th><th>Subtotal</th><th>P.Venta</th><th></th></tr></thead>
                <tbody id="tbl_compra_body"></tbody>
            </table>
        </div>

        <div style="display:flex; gap:10px; margin-top:14px;">
            <button class="btn btn-red" onclick="eliminarFilaCompra()">🗑 Eliminar ítem</button>
            <button class="btn btn-green" style="flex:1;" onclick="guardarCompra()">💾 Guardar Compra</button>
        </div>
    </div>
</div>

<!-- ============================================================ -->
<!-- SECCIÓN GASTOS                                                -->
<!-- ============================================================ -->
<div id="sec-gastos" class="section" style="display:none;">
    <div class="card">
        <div class="card-header">
            <span class="card-title">💸 Registro de Gastos</span>
        </div>
        <div class="form-row">
            <div class="form-group" style="flex:2;">
                <label>Tipo de Gasto</label>
                <input type="text" id="g_tipo" placeholder="Descripción del gasto" autocomplete="off">
            </div>
            <div class="form-group" style="flex:0 0 140px;">
                <label>Cantidad S/</label>
                <input type="number" id="g_cantidad" step="0.01" placeholder="0.00" min="0.01">
            </div>
            <div class="form-group" style="flex:0 0 auto; justify-content:flex-end;">
                <label>&nbsp;</label>
                <button class="btn btn-green" onclick="agregarGasto()">+ Agregar</button>
            </div>
        </div>

        <div class="tbl-wrap">
            <table class="data-table" id="tbl_gastos">
                <thead><tr><th>ID</th><th>Tipo de Gasto</th><th>Monto S/</th><th></th></tr></thead>
                <tbody id="tbl_gastos_body"></tbody>
            </table>
        </div>
    </div>
</div>

<!-- ============================================================ -->
<!-- SECCIÓN BALANCE                                               -->
<!-- ============================================================ -->
<div id="sec-balance" class="section" style="display:none;">
    <div class="cards-grid">
        <div class="card">
            <div class="card-header"><span class="card-title">💰 Por Método de Pago</span></div>
            <div class="stat-box"><span class="stat-label">Efectivo</span><span class="stat-value" id="b_efectivo">S/ 0.00</span></div>
            <div class="stat-box"><span class="stat-label">Yape</span><span class="stat-value" id="b_yape">S/ 0.00</span></div>
            <div class="stat-box"><span class="stat-label">Plin</span><span class="stat-value" id="b_plin">S/ 0.00</span></div>
            <div class="stat-box"><span class="stat-label">Tarjeta</span><span class="stat-value" id="b_tarjeta">S/ 0.00</span></div>
        </div>
        <div class="card">
            <div class="card-header"><span class="card-title">📊 Resumen del Día</span></div>
            <div class="stat-box"><span class="stat-label">Venta Total</span><span class="stat-value" id="b_ventatotal">S/ 0.00</span></div>
            <div class="stat-box"><span class="stat-label">Total Gastos</span><span class="stat-value red" id="b_gastos">S/ 0.00</span></div>
            <div class="stat-box"><span class="stat-label">Efectivo Neto</span><span class="stat-value yellow" id="b_neto">S/ 0.00</span></div>
        </div>
        <div class="card">
            <div class="card-header"><span class="card-title">📤 Exportar</span></div>
            <p style="color:#a0b0c8; font-size:13px; margin-bottom:14px;">Genera el reporte del balance del día en Excel.</p>
            <button class="btn btn-green" style="width:100%;" onclick="exportarBalance()">📊 Exportar Balance Excel</button>
        </div>
    </div>

    <div class="cards-grid-2" style="margin-top:16px;">
        <div class="card">
            <div class="card-header"><span class="card-title">💰 Métodos de Pago (Totales)</span></div>
            <div class="chart-big" style="height:340px;"><canvas id="chart_balance_metodos"></canvas></div>
        </div>
        <div class="card">
            <div class="card-header"><span class="card-title">📊 Resumen del Día</span></div>
            <div class="chart-big" style="height:340px;"><canvas id="chart_balance_resumen"></canvas></div>
        </div>
    </div>
</div>

<!-- ============================================================ -->
<!-- SECCIÓN HISTORIAL DE VENTAS                                   -->
<!-- ============================================================ -->
<div id="sec-historial" class="section" style="display:none;">
    <div class="card">
        <div class="card-header">
            <span class="card-title">📋 Ventas Registradas</span>
            <div style="display:flex; gap:8px;">
                <input type="date" id="h_fecha" value="<?php echo date('Y-m-d'); ?>" style="width:160px;">
                <button class="btn btn-blue btn-sm" onclick="cargarHistorial()">🔍 Buscar</button>
            </div>
        </div>
        <div class="tbl-wrap">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID Venta</th>
                        <th>Total</th>
                        <th>Descuento</th>
                        <th>Sub-Total</th>
                        <th>IGV</th>
                        <th>Método</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody id="tbl_historial_body"></tbody>
            </table>
        </div>
    </div>

    <div class="card" style="margin-top:16px;">
        <div class="card-header">
            <span class="card-title">📈 Ventas del Día por Hora</span>
            <button class="btn btn-blue btn-sm" onclick="cargarHistorialTendencia()">🔄 Refrescar</button>
        </div>
        <p style="color:#a0b0c8; font-size:12px; margin-bottom:8px;">Cada punto es una venta registrada ese día (según la hora exacta del campo fecha de venta), ordenadas cronológicamente.</p>
        <div class="chart-big"><canvas id="chart_historial_tendencia"></canvas></div>
    </div>
</div>

<!-- ============================================================ -->
<!-- SECCIÓN DASHBOARD                                             -->
<!-- ============================================================ -->
<div id="sec-dashboard" class="section" style="display:none;">

    <div class="dash-tabs">
        <button class="dash-tab-btn active" onclick="showDashTab('stock', event)">📦 Stock</button>
        <button class="dash-tab-btn" onclick="showDashTab('ventas', event)">💵 Ventas</button>
        <button class="dash-tab-btn" onclick="showDashTab('ventascat', event)">🗂 Ventas por Categoría</button>
        <button class="dash-tab-btn" onclick="showDashTab('margen', event)">📐 Ventas y Margen</button>
    </div>

    <!-- ---------- STOCK ---------- -->
    <div id="dash-stock" class="dash-panel">
        <div class="card">
            <div class="card-header">
                <span class="card-title">📦 Stock en vivo por producto</span>
                <div style="display:flex; gap:8px; align-items:center;">
                    <select id="stock_categoria" onchange="cargarDashboardStock()" style="width:220px;">
                        <option value="">Todas las categorías</option>
                        <?php
                        $rc2 = mysqli_query($cn, "SELECT id_categoria, nombre FROM categorias ORDER BY nombre");
                        while ($cat2 = mysqli_fetch_assoc($rc2)) {
                            echo "<option value='{$cat2['id_categoria']}'>{$cat2['nombre']}</option>";
                        }
                        ?>
                    </select>
                    <button class="btn btn-blue btn-sm" onclick="cargarDashboardStock()">🔄 Refrescar</button>
                </div>
            </div>
            <p style="color:#a0b0c8; font-size:12px; margin-bottom:8px;">El eje horizontal muestra el <strong>ID</strong> de cada producto (no el nombre completo, para que la gráfica no se sature). Consulta el nombre en la tabla de abajo. Se actualiza automáticamente cada 15 segundos.</p>
            <div class="chart-big"><canvas id="chart_stock"></canvas></div>
        </div>

        <div class="card" style="margin-top:16px;">
            <div class="card-header"><span class="card-title">📋 Detalle de productos</span></div>
            <div class="tbl-wrap" style="max-height:280px; overflow-y:auto;">
                <table class="data-table">
                    <thead><tr><th>ID</th><th>Producto</th><th>Categoría</th><th>Stock</th></tr></thead>
                    <tbody id="tbl_stock_body"></tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- ---------- VENTAS ---------- -->
    <div id="dash-ventas" class="dash-panel" style="display:none;">
        <div class="card">
            <div class="card-header">
                <span class="card-title">💵 Ventas por Periodo</span>
                <div style="display:flex; gap:8px; align-items:center;">
                    <input type="date" id="ventas_fecha_ref" value="<?php echo date('Y-m-d'); ?>" onchange="cargarDashboardVentas()">
                    <select id="ventas_periodo" onchange="cargarDashboardVentas()">
                        <option value="dia">Día</option>
                        <option value="semana">Semana</option>
                        <option value="mes" selected>Mes</option>
                        <option value="bimestre">Bimestre</option>
                        <option value="trimestre">Trimestre</option>
                        <option value="anio">Año</option>
                    </select>
                </div>
            </div>
            <p style="color:#a0b0c8; font-size:12px; margin-bottom:8px;" id="ventas_desc_periodo">Mostrando el total de ventas de cada día del mes seleccionado.</p>
            <div class="chart-big"><canvas id="chart_ventas"></canvas></div>
        </div>
    </div>

    <!-- ---------- VENTAS POR CATEGORIA ---------- -->
    <div id="dash-ventascat" class="dash-panel" style="display:none;">
        <div class="card">
            <div class="card-header">
                <span class="card-title">🗂 Ventas por Categoría</span>
                <div style="display:flex; gap:8px; align-items:center;">
                    <input type="date" id="ventascat_fecha_ref" value="<?php echo date('Y-m-d'); ?>" onchange="cargarDashboardVentasCategoria()">
                    <select id="ventascat_periodo" onchange="cargarDashboardVentasCategoria()">
                        <option value="dia">Día</option>
                        <option value="semana">Semana</option>
                        <option value="mes" selected>Mes</option>
                    </select>
                </div>
            </div>
            <p style="color:#a0b0c8; font-size:12px; margin-bottom:8px;">Monto total vendido (S/) por categoría de producto, según el periodo seleccionado.</p>
            <div class="chart-big"><canvas id="chart_ventascat"></canvas></div>
        </div>
    </div>

    <!-- ---------- VENTAS Y MARGEN (matriz real por categoría/producto) ---------- -->
    <div id="dash-margen" class="dash-panel" style="display:none;">
        <div class="card">
            <div class="card-header">
                <span class="card-title">📐 Matriz de Ventas y Margen por Categoría</span>
                <div style="display:flex; gap:8px; align-items:center;">
                    <input type="date" id="margen_fecha_ref" value="<?php echo date('Y-m-d'); ?>" onchange="cargarDashboardMargen()">
                    <select id="margen_periodo" onchange="cargarDashboardMargen()">
                        <option value="dia">Día</option>
                        <option value="semana">Semana</option>
                        <option value="mes" selected>Mes</option>
                        <option value="bimestre">Bimestre</option>
                        <option value="trimestre">Trimestre</option>
                        <option value="anio">Año</option>
                    </select>
                </div>
            </div>
            <p style="color:#a0b0c8; font-size:12px; margin-bottom:12px;">
                ⚠️ Los <strong>costos</strong> son estimados (65% del precio de venta) porque el catálogo no registra el costo real por producto.
                Las <strong>ventas, unidades y % vendido</strong> son datos reales del periodo seleccionado. Haz clic en una categoría para ver sus productos.
            </p>
            <div class="tbl-wrap" style="max-height:520px; overflow-y:auto;">
                <table class="data-table matrix-table" id="tbl_margen">
                    <thead>
                        <tr>
                            <th>Categoría / Producto</th><th>Costos</th><th>Ventas</th><th>Margen</th>
                            <th>Margen %</th><th>Unid. Vendidas</th><th>% Vendido</th><th>Únicos</th><th>General</th><th>Únicos %</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_margen_body"></tbody>
                </table>
            </div>
        </div>

        <div class="card" style="margin-top:16px;">
            <div class="card-header"><span class="card-title">📊 Ventas, Costos y Margen por Categoría</span></div>
            <div class="chart-big"><canvas id="chart_margen"></canvas></div>
        </div>
    </div>

</div>

</div><!-- /main -->

<!-- ============================================================ -->
<!-- MODAL: SELECCIONAR EMPLEADO                                   -->
<!-- ============================================================ -->
<div class="modal-overlay" id="modal-empleado">
    <div class="modal" style="max-width:420px;">
        <div class="modal-header">
            <span class="modal-title">👤 ¿Quién está atendiendo?</span>
            <button class="modal-close" onclick="cerrarModal('modal-empleado')">×</button>
        </div>
        <div class="form-group" style="margin-bottom:14px;">
            <label>Selecciona tu nombre</label>
            <select id="sel_empleado">
                <option value="">-- Seleccionar empleado --</option>
            </select>
        </div>
        <button class="btn btn-green" style="width:100%; margin-bottom:18px;" onclick="confirmarEmpleado()">✅ Empezar turno</button>

        <div style="border-top:1px solid #0f3460; padding-top:14px;">
            <label style="font-size:11px; color:#a0b0c8; font-weight:600; text-transform:uppercase;">¿Empleado nuevo?</label>
            <div style="display:flex; gap:8px; margin-top:6px;">
                <input type="text" id="nuevo_empleado_nombre" placeholder="Nombre completo" style="flex:1;">
                <button class="btn btn-blue btn-sm" onclick="crearYSeleccionarEmpleado()">+ Añadir</button>
            </div>
        </div>
    </div>
</div>

<!-- ============================================================ -->
<!-- AUTOCOMPLETE BOX                                              -->
<!-- ============================================================ -->
<div id="autocomplete-box">
    <div class="ac-header">
        <span>ID</span><span>Nombre</span><span>Costo</span><span>Stock</span><span>Precio</span>
    </div>
    <div id="ac-results"></div>
</div>

<!-- ============================================================ -->
<!-- MODAL: CONFIRMAR TIPO COMPROBANTE                             -->
<!-- ============================================================ -->
<div class="modal-overlay" id="modal-comprobante">
    <div class="modal" style="max-width:360px;">
        <div class="modal-header">
            <span class="modal-title">📄 Tipo de Comprobante</span>
            <button class="modal-close" onclick="cerrarModal('modal-comprobante')">×</button>
        </div>
        <p style="color:#a0b0c8; margin-bottom:16px;">¿Qué comprobante deseas generar?</p>
        <div style="display:flex; flex-direction:column; gap:10px;">
            <button class="btn btn-blue" onclick="guardarVentaFinal('Factura')">🧾 Factura</button>
            <button class="btn btn-green" onclick="guardarVentaFinal('Boleta')">📃 Boleta</button>
            <button class="btn btn-orange" onclick="guardarVentaFinal('Ninguno')">🚫 No generar</button>
        </div>
    </div>
</div>

<!-- ============================================================ -->
<!-- MODAL: DETALLE DE VENTA (historial)                           -->
<!-- ============================================================ -->
<div class="modal-overlay" id="modal-detalle">
    <div class="modal wide">
        <div class="modal-header">
            <span class="modal-title" id="modal-detalle-title">Detalle de Venta</span>
            <button class="modal-close" onclick="cerrarModal('modal-detalle')">×</button>
        </div>
        <div class="tbl-wrap">
            <table class="data-table">
                <thead><tr><th>ID Prod.</th><th>Nombre</th><th>Cant.</th><th>P.Unit</th><th>Subtotal</th><th>Desc.</th><th>Acciones</th></tr></thead>
                <tbody id="tbl_detalle_body"></tbody>
            </table>
        </div>
        <div style="display:flex; gap:10px; margin-top:16px;">
            <button class="btn btn-red" onclick="eliminarProdDetalle()">🗑 Eliminar ítem</button>
            <button class="btn btn-green" onclick="imprimirDesdeDetalle()">🖨 Imprimir</button>
        </div>
    </div>
</div>

<!-- ============================================================ -->
<!-- MODAL: NUEVO PROVEEDOR                                        -->
<!-- ============================================================ -->
<div class="modal-overlay" id="modal-proveedor">
    <div class="modal" style="max-width:420px;">
        <div class="modal-header">
            <span class="modal-title">🏢 Nuevo Proveedor</span>
            <button class="modal-close" onclick="cerrarModal('modal-proveedor')">×</button>
        </div>
        <div class="form-group" style="margin-bottom:10px;"><label>Nombre Empresa</label><input type="text" id="p_nombre"></div>
        <div class="form-group" style="margin-bottom:10px;"><label>RUC</label><input type="text" id="p_ruc" maxlength="11"></div>
        <div class="form-group" style="margin-bottom:10px;"><label>Teléfono</label><input type="text" id="p_tel"></div>
        <div class="form-group" style="margin-bottom:16px;"><label>Dirección</label><input type="text" id="p_dir"></div>
        <button class="btn btn-green" style="width:100%;" onclick="guardarProveedor()">💾 Guardar</button>
    </div>
</div>

<!-- ============================================================ -->
<!-- MODAL: NUEVO PRODUCTO                                         -->
<!-- ============================================================ -->
<div class="modal-overlay" id="modal-producto">
    <div class="modal" style="max-width:420px;">
        <div class="modal-header">
            <span class="modal-title">📦 Nuevo Producto</span>
            <button class="modal-close" onclick="cerrarModal('modal-producto')">×</button>
        </div>
        <div class="form-group" style="margin-bottom:10px;"><label>Nombre del Producto</label><input type="text" id="np_nombre"></div>
        <div class="form-group" style="margin-bottom:16px;">
            <label>Categoría</label>
            <select id="np_categoria">
                <option value="">-- Sin categoría --</option>
                <?php
                $rc = mysqli_query($cn, "SELECT id_categoria, nombre FROM categorias ORDER BY nombre");
                while ($cat = mysqli_fetch_assoc($rc)) {
                    echo "<option value='{$cat['id_categoria']}'>{$cat['nombre']}</option>";
                }
                ?>
            </select>
        </div>
        <button class="btn btn-green" style="width:100%;" onclick="guardarProducto()">💾 Guardar</button>
    </div>
</div>

<script src="js/app.js"></script>
<script>
    // Inicializar con la fecha de hoy
    document.getElementById('h_fecha').value = document.getElementById('fecha_global').value;
    actualizarTodo();
    initEmpleado();
</script>
</body>
</html>
