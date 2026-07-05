// ========================================================
// FERRETERIA SYSTEM - app.js
// ========================================================

// ---- SECCIONES ----
function showSection(sec) {
    document.querySelectorAll('.section').forEach(s => s.style.display = 'none');
    document.getElementById('sec-' + sec).style.display = 'block';
    document.querySelectorAll('.nav-btn').forEach(b => b.classList.remove('active'));
    event.currentTarget.classList.add('active');
    if (sec === 'balance')  cargarBalance();
    if (sec === 'gastos')   cargarGastos();
    if (sec === 'historial') cargarHistorial();
    if (sec === 'dashboard') cargarDashboardStock();
}

function actualizarTodo() {
    const fecha = document.getElementById('fecha_global').value;
    document.getElementById('h_fecha').value = fecha;
    cargarBalance();
    cargarGastos();
    document.getElementById('lbl_fecha_texto').textContent = '📅 ' + fecha;
}

// ---- MODALES ----
function cerrarModal(id) {
    document.getElementById(id).classList.remove('active');
}

document.querySelectorAll('.modal-overlay').forEach(m => {
    m.addEventListener('click', e => { if (e.target === m) m.classList.remove('active'); });
});

// ========================================================
// VENTAS
// ========================================================
let itemsVenta = [];
let productoSeleccionado = null;

function buscarProducto(texto) {
    if (!texto || texto.length < 1) { ocultarAC(); return; }
    fetch('api/buscar_producto.php?q=' + encodeURIComponent(texto))
        .then(r => r.json())
        .then(data => mostrarAC(data));
}

function mostrarAC(productos) {
    const box = document.getElementById('autocomplete-box');
    const res = document.getElementById('ac-results');
    if (!productos.length) { box.style.display = 'none'; return; }

    res.innerHTML = '';
    productos.forEach(p => {
        const row = document.createElement('div');
        row.className = 'ac-row';
        row.innerHTML = `<span>${p.id}</span><span title="${p.nombre}">${p.nombre}</span><span>S/ ${parseFloat(p.costo).toFixed(2)}</span><span>${p.stock}</span><span>S/ ${parseFloat(p.precio).toFixed(2)}</span>`;
        row.addEventListener('mousedown', () => seleccionarProductoAC(p));
        res.appendChild(row);
    });

    const input = document.getElementById('v_buscar');
    const rect = input.getBoundingClientRect();
    box.style.left = rect.left + 'px';
    box.style.top  = (rect.bottom + window.scrollY) + 'px';
    box.style.display = 'block';
}

function ocultarAC() {
    document.getElementById('autocomplete-box').style.display = 'none';
}

function seleccionarProductoAC(prod) {
    productoSeleccionado = prod;
    document.getElementById('v_buscar').value = prod.nombre;
    ocultarAC();
    agregarItem(prod);
}

function agregarItem(prod) {
    const cantidad = parseInt(document.getElementById('v_cantidad').value) || 1;
    const descuento = parseFloat(document.getElementById('v_descuento').value) || 0;
    const precio = parseFloat(prod.precio);
    const importe = parseFloat((precio * cantidad).toFixed(2));

    const item = { id: prod.id, nombre: prod.nombre, cantidad, precio, importe, descuento };
    itemsVenta.push(item);

    renderTablaVenta();
    calcularResumen();

    document.getElementById('v_buscar').value = '';
    document.getElementById('v_cantidad').value = 1;
    document.getElementById('v_descuento').value = 0;
    productoSeleccionado = null;
}

function agregarProductoManual() {
    if (!productoSeleccionado) {
        alert('Selecciona un producto de la lista de sugerencias.');
        return;
    }
    agregarItem(productoSeleccionado);
}

function renderTablaVenta() {
    const tbody = document.getElementById('tbl_venta_body');
    tbody.innerHTML = '';
    itemsVenta.forEach((it, i) => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${it.id}</td>
            <td>${it.nombre}</td>
            <td>${it.cantidad}</td>
            <td class="num">S/ ${it.precio.toFixed(2)}</td>
            <td class="num">S/ ${it.importe.toFixed(2)}</td>
            <td class="num red" style="color:#e94560;">S/ ${it.descuento.toFixed(2)}</td>
            <td><button class="btn btn-red btn-sm" onclick="quitarItemVenta(${i})">✖</button></td>
        `;
        tbody.appendChild(tr);
    });
}

function quitarItemVenta(idx) {
    itemsVenta.splice(idx, 1);
    renderTablaVenta();
    calcularResumen();
}

function eliminarFilaVenta() {
    // Elimina el último seleccionado si no se tiene click directo
    if (itemsVenta.length === 0) return;
    itemsVenta.pop();
    renderTablaVenta();
    calcularResumen();
}

function calcularResumen() {
    let totalImporte = 0, totalDesc = 0;
    itemsVenta.forEach(it => {
        totalImporte += it.importe;
        totalDesc    += it.descuento;
    });

    const neto = totalImporte - totalDesc;
    const base = parseFloat((neto / 1.18).toFixed(2));
    const igv  = parseFloat((neto - base).toFixed(2));

    document.getElementById('r_base').textContent  = 'S/ ' + base.toFixed(2);
    document.getElementById('r_desc').textContent  = 'S/ ' + totalDesc.toFixed(2);
    document.getElementById('r_igv').textContent   = 'S/ ' + igv.toFixed(2);
    document.getElementById('r_sub').textContent   = 'S/ ' + totalImporte.toFixed(2);
    document.getElementById('r_total').textContent = 'S/ ' + neto.toFixed(2);
}

function limpiarVenta() {
    itemsVenta = [];
    renderTablaVenta();
    calcularResumen();
    document.getElementById('cli_nombre').value = '';
    document.getElementById('cli_dni').value = '';
    document.getElementById('cli_ruc').value = '';
    document.getElementById('metodo_pago').value = 'Efectivo';
}

function abrirModalGuardarVenta() {
    if (itemsVenta.length === 0) { alert('No hay productos en la venta.'); return; }
    if (!empleadoActivo) {
        alert('⚠️ Antes de registrar la venta debes indicar qué empleado está atendiendo.');
        document.getElementById('modal-empleado').classList.add('active');
        return;
    }
    document.getElementById('modal-comprobante').classList.add('active');
}

function guardarVentaFinal(tipoComprobante) {
    cerrarModal('modal-comprobante');

    const datos = {
        fecha:    document.getElementById('fecha_global').value,
        nombre:   document.getElementById('cli_nombre').value,
        dni:      document.getElementById('cli_dni').value,
        ruc:      document.getElementById('cli_ruc').value,
        metodo:   document.getElementById('metodo_pago').value,
        items:    itemsVenta,
        base:     parseFloat(document.getElementById('r_base').textContent.replace('S/ ','')),
        descuento:parseFloat(document.getElementById('r_desc').textContent.replace('S/ ','')),
        igv:      parseFloat(document.getElementById('r_igv').textContent.replace('S/ ','')),
        subtotal: parseFloat(document.getElementById('r_sub').textContent.replace('S/ ','')),
        total:    parseFloat(document.getElementById('r_total').textContent.replace('S/ ','')),
        comprobante: tipoComprobante,
        id_empleado: empleadoActivo ? empleadoActivo.id : null
    };

    fetch('api/guardar_venta.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(datos)
    })
    .then(r => r.json())
    .then(res => {
        if (res.ok) {
            alert('✅ Venta registrada correctamente. ID: ' + res.id_venta);
            limpiarVenta();
            cargarBalance();
        } else {
            alert('❌ Error: ' + res.error);
        }
    });
}

// ========================================================
// COMPRAS
// ========================================================
let itemsCompra = [];

function agregarItemCompra() {
    const idprod   = parseInt(document.getElementById('c_idprod').value);
    const cantidad = parseInt(document.getElementById('c_cantidad').value) || 1;
    const costo    = parseFloat(document.getElementById('c_costo').value) || 0;

    if (!idprod || !costo) { alert('Completa ID de producto y costo.'); return; }

    fetch('api/buscar_prod_id.php?id=' + idprod)
        .then(r => r.json())
        .then(prod => {
            if (!prod.id) { alert('Producto no encontrado.'); return; }
            const subtotal = parseFloat((cantidad * costo).toFixed(2));
            const item = { id: prod.id, nombre: prod.nombre, cantidad, costo, subtotal, precio_venta: prod.precio };
            itemsCompra.push(item);
            renderTablaCompra();
            document.getElementById('c_idprod').value = '';
            document.getElementById('c_cantidad').value = 1;
            document.getElementById('c_costo').value = '';
        });
}

function renderTablaCompra() {
    const tbody = document.getElementById('tbl_compra_body');
    tbody.innerHTML = '';
    itemsCompra.forEach((it, i) => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${it.id}</td>
            <td>${it.nombre}</td>
            <td>${it.cantidad}</td>
            <td class="num">S/ ${it.costo.toFixed(2)}</td>
            <td class="num">S/ ${it.subtotal.toFixed(2)}</td>
            <td class="num">S/ ${parseFloat(it.precio_venta).toFixed(2)}</td>
            <td><button class="btn btn-red btn-sm" onclick="quitarItemCompra(${i})">✖</button></td>
        `;
        tbody.appendChild(tr);
    });
}

function quitarItemCompra(idx) {
    itemsCompra.splice(idx, 1);
    renderTablaCompra();
}

function eliminarFilaCompra() {
    if (itemsCompra.length === 0) return;
    itemsCompra.pop();
    renderTablaCompra();
}

function guardarCompra() {
    if (!itemsCompra.length) { alert('No hay productos en la compra.'); return; }
    const datos = {
        fecha:       document.getElementById('c_fecha').value,
        id_proveedor: document.getElementById('c_proveedor').value || null,
        items:       itemsCompra
    };

    fetch('api/guardar_compra.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(datos)
    })
    .then(r => r.json())
    .then(res => {
        if (res.ok) {
            alert('✅ Compra registrada. ID: ' + res.id_compra);
            itemsCompra = [];
            renderTablaCompra();
        } else {
            alert('❌ Error: ' + res.error);
        }
    });
}

function guardarProveedor() {
    const datos = {
        nombre: document.getElementById('p_nombre').value,
        ruc:    document.getElementById('p_ruc').value,
        tel:    document.getElementById('p_tel').value,
        dir:    document.getElementById('p_dir').value
    };
    fetch('api/guardar_proveedor.php', {
        method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify(datos)
    })
    .then(r=>r.json()).then(res => {
        if (res.ok) {
            alert('✅ Proveedor guardado.');
            cerrarModal('modal-proveedor');
            location.reload();
        } else alert('❌ ' + res.error);
    });
}

function guardarProducto() {
    const datos = {
        nombre:      document.getElementById('np_nombre').value,
        id_categoria: document.getElementById('np_categoria').value || null
    };
    fetch('api/guardar_producto.php', {
        method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify(datos)
    })
    .then(r=>r.json()).then(res => {
        if (res.ok) {
            alert('✅ Producto registrado con ID: ' + res.id);
            document.getElementById('c_idprod').value = res.id;
            cerrarModal('modal-producto');
        } else alert('❌ ' + res.error);
    });
}

// ========================================================
// GASTOS
// ========================================================
function cargarGastos() {
    const fecha = document.getElementById('fecha_global').value;
    fetch('api/gastos.php?fecha=' + fecha)
        .then(r => r.json())
        .then(data => {
            const tbody = document.getElementById('tbl_gastos_body');
            tbody.innerHTML = '';
            data.forEach(g => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>${g.id}</td>
                    <td>${g.tipo}</td>
                    <td class="num">S/ ${parseFloat(g.cantidad).toFixed(2)}</td>
                    <td><button class="btn btn-red btn-sm" onclick="eliminarGasto(${g.id}, this)">🗑</button></td>
                `;
                tbody.appendChild(tr);
            });
        });
}

function agregarGasto() {
    const tipo     = document.getElementById('g_tipo').value.trim();
    const cantidad = parseFloat(document.getElementById('g_cantidad').value);
    const fecha    = document.getElementById('fecha_global').value;

    if (!tipo) { alert('Ingresa el tipo de gasto.'); return; }
    if (!cantidad || cantidad <= 0) { alert('Ingresa una cantidad válida.'); return; }

    fetch('api/guardar_gasto.php', {
        method:'POST', headers:{'Content-Type':'application/json'},
        body: JSON.stringify({ tipo, cantidad, fecha })
    })
    .then(r => r.json())
    .then(res => {
        if (res.ok) {
            document.getElementById('g_tipo').value = '';
            document.getElementById('g_cantidad').value = '';
            cargarGastos();
            cargarBalance();
        } else alert('❌ ' + res.error);
    });
}

function eliminarGasto(id, btn) {
    if (!confirm('¿Eliminar este gasto?')) return;
    fetch('api/eliminar_gasto.php?id=' + id)
        .then(r => r.json())
        .then(res => {
            if (res.ok) { btn.closest('tr').remove(); cargarBalance(); }
            else alert('❌ ' + res.error);
        });
}

// ========================================================
// BALANCE
// ========================================================
function cargarBalance() {
    const fecha = document.getElementById('fecha_global').value;
    fetch('api/balance.php?fecha=' + fecha)
        .then(r => r.json())
        .then(d => {
            document.getElementById('b_efectivo').textContent  = 'S/ ' + parseFloat(d.efectivo||0).toFixed(2);
            document.getElementById('b_yape').textContent      = 'S/ ' + parseFloat(d.yape||0).toFixed(2);
            document.getElementById('b_plin').textContent      = 'S/ ' + parseFloat(d.plin||0).toFixed(2);
            document.getElementById('b_tarjeta').textContent   = 'S/ ' + parseFloat(d.tarjeta||0).toFixed(2);
            document.getElementById('b_ventatotal').textContent= 'S/ ' + parseFloat(d.venta_total||0).toFixed(2);
            document.getElementById('b_gastos').textContent    = 'S/ ' + parseFloat(d.total_gastos||0).toFixed(2);
            document.getElementById('b_neto').textContent      = 'S/ ' + parseFloat(d.efectivo_neto||0).toFixed(2);
            renderChartsBalance(d);
        });
}

let chartBalanceMetodos = null;
let chartBalanceResumen = null;
function renderChartsBalance(d) {
    const efectivo = parseFloat(d.efectivo || 0);
    const yape     = parseFloat(d.yape || 0);
    const plin     = parseFloat(d.plin || 0);
    const tarjeta  = parseFloat(d.tarjeta || 0);
    const ventaTotal   = parseFloat(d.venta_total || 0);
    const totalGastos  = parseFloat(d.total_gastos || 0);
    const efectivoNeto = parseFloat(d.efectivo_neto || 0);

    // ---- Gráfico 1: métodos de pago ----
    const ctx1 = document.getElementById('chart_balance_metodos');
    if (chartBalanceMetodos) chartBalanceMetodos.destroy();
    chartBalanceMetodos = new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: ['Efectivo', 'Yape', 'Plin', 'Tarjeta'],
            datasets: [{
                label: 'Total S/',
                data: [efectivo, yape, plin, tarjeta],
                backgroundColor: ['#4ecca3', '#60b0ff', '#b06fe0', '#ff9f43'],
                borderRadius: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
                x: { ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' } },
                y: { ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' }, title: { display: true, text: 'S/', color: '#a0b0c8' } }
            }
        }
    });

    // ---- Gráfico 2: resumen del día ----
    const ctx2 = document.getElementById('chart_balance_resumen');
    if (chartBalanceResumen) chartBalanceResumen.destroy();
    chartBalanceResumen = new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: ['Venta Total', 'Total Gastos', 'Efectivo Neto'],
            datasets: [{
                label: 'S/',
                data: [ventaTotal, totalGastos, efectivoNeto],
                backgroundColor: ['#60b0ff', '#e94560', '#f7c948'],
                borderRadius: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
                x: { ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' } },
                y: { ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' }, title: { display: true, text: 'S/', color: '#a0b0c8' } }
            }
        }
    });
}

function exportarBalance() {
    const fecha = document.getElementById('fecha_global').value;
    window.open('api/exportar_balance.php?fecha=' + fecha);
}

// ========================================================
// HISTORIAL
// ========================================================
function cargarHistorial() {
    const fecha = document.getElementById('h_fecha').value;
    fetch('api/historial_ventas.php?fecha=' + fecha)
        .then(r => r.json())
        .then(data => {
            const tbody = document.getElementById('tbl_historial_body');
            tbody.innerHTML = '';
            data.forEach(v => {
                const metodoBadge = {
                    'Efectivo':'badge-green','Yape':'badge-blue','Plin':'badge-yellow','Tarjeta':'badge-red'
                }[v.metodo_pago] || 'badge-blue';
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td><strong>#${v.id_venta}</strong></td>
                    <td class="num">S/ ${parseFloat(v.total).toFixed(2)}</td>
                    <td class="num">S/ ${parseFloat(v.total_desc).toFixed(2)}</td>
                    <td class="num">S/ ${parseFloat(v.total_desc_sd).toFixed(2)}</td>
                    <td class="num">S/ ${parseFloat(v.total_igv).toFixed(2)}</td>
                    <td><span class="badge ${metodoBadge}">${v.metodo_pago}</span></td>
                    <td style="display:flex; gap:6px;">
                        <button class="btn btn-blue btn-sm" onclick="verDetalle(${v.id_venta})">🔍 Detalle</button>
                        <button class="btn btn-red btn-sm" onclick="eliminarVenta(${v.id_venta}, this)">🗑</button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        });
    cargarHistorialTendencia();
}

let chartHistorialTendencia = null;
function cargarHistorialTendencia() {
    const fecha = document.getElementById('h_fecha').value;
    fetch(`api/ventas_por_hora.php?fecha=${fecha}`)
        .then(r => r.json())
        .then(data => {
            const labels = data.map(v => v.hora);
            const valores = data.map(v => parseFloat(v.total));
            const ids = data.map(v => v.id_venta);

            const ctx = document.getElementById('chart_historial_tendencia');
            if (chartHistorialTendencia) chartHistorialTendencia.destroy();
            chartHistorialTendencia = new Chart(ctx, {
                type: 'line',
                data: {
                    labels,
                    datasets: [{
                        label: 'Venta S/',
                        data: valores,
                        borderColor: '#60b0ff',
                        backgroundColor: 'rgba(96,176,255,0.15)',
                        tension: 0.25,
                        fill: true,
                        pointRadius: 4,
                        pointHoverRadius: 6,
                        pointBackgroundColor: '#60b0ff'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { labels: { color: '#a0b0c8' } },
                        tooltip: {
                            callbacks: {
                                label: (ctx) => `Venta #${ids[ctx.dataIndex]}: S/ ${ctx.parsed.y.toFixed(2)}`
                            }
                        }
                    },
                    scales: {
                        x: { title: { display: true, text: 'Hora de la venta', color: '#a0b0c8' }, ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' } },
                        y: { title: { display: true, text: 'S/', color: '#a0b0c8' }, ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' } }
                    }
                }
            });
        });
}

let ventaDetalleActual = null;

function verDetalle(id_venta) {
    ventaDetalleActual = id_venta;
    document.getElementById('modal-detalle-title').textContent = 'Detalle de Venta #' + id_venta;
    fetch('api/detalle_venta.php?id=' + id_venta)
        .then(r => r.json())
        .then(data => {
            const tbody = document.getElementById('tbl_detalle_body');
            tbody.innerHTML = '';
            data.forEach(it => {
                const tr = document.createElement('tr');
                tr.dataset.idprod = it.id_producto;
                tr.innerHTML = `
                    <td>${it.id_producto}</td>
                    <td>${it.nombre}</td>
                    <td class="td-cantidad">${it.cantidad}</td>
                    <td class="num">S/ ${parseFloat(it.precio_unitario).toFixed(2)}</td>
                    <td class="num">S/ ${parseFloat(it.subtotal).toFixed(2)}</td>
                    <td class="num">S/ ${parseFloat(it.descuento_unitario||0).toFixed(2)}</td>
                    <td style="display:flex; gap:6px; align-items:center;">
                        <input type="checkbox" class="chk-detalle">
                        <button class="btn btn-blue btn-sm btn-editar-cant" onclick="editarCantidadDetalle(this, ${it.id_producto}, ${it.cantidad})">✏️</button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
            document.getElementById('modal-detalle').classList.add('active');
        });
}

function eliminarProdDetalle() {
    const checkeds = document.querySelectorAll('.chk-detalle:checked');
    if (!checkeds.length) { alert('Selecciona al menos un producto.'); return; }
    if (!confirm('¿Eliminar los productos seleccionados de esta venta?')) return;
    checkeds.forEach(chk => {
        const tr = chk.closest('tr');
        const id_producto = tr.dataset.idprod;
        fetch('api/eliminar_detalle.php', {
            method:'POST', headers:{'Content-Type':'application/json'},
            body: JSON.stringify({ id_venta: ventaDetalleActual, id_producto })
        })
        .then(r=>r.json()).then(res => {
            if (res.ok) tr.remove();
            else alert('❌ ' + res.error);
        });
    });
}

function imprimirDesdeDetalle() {
    if (!ventaDetalleActual) return;
    window.open('api/comprobante.php?id=' + ventaDetalleActual);
}

function editarCantidadDetalle(btn, id_producto, cantidadActual) {
    const tr = btn.closest('tr');
    const tdCant = tr.querySelector('.td-cantidad');
    tdCant.innerHTML = `<input type="number" min="1" value="${cantidadActual}" class="input-edit-cant" style="width:70px;">`;

    const tdAcciones = btn.closest('td');
    tdAcciones.innerHTML = `
        <button class="btn btn-green btn-sm" onclick="guardarEdicionCantidad(this, ${id_producto})">💾</button>
        <button class="btn btn-red btn-sm" onclick="verDetalle(ventaDetalleActual)">✖</button>
    `;
}

function guardarEdicionCantidad(btn, id_producto) {
    const tr = btn.closest('tr');
    const nuevaCantidad = parseInt(tr.querySelector('.input-edit-cant').value);

    if (!nuevaCantidad || nuevaCantidad <= 0) { alert('Ingresa una cantidad válida.'); return; }

    fetch('api/editar_detalle.php', {
        method: 'POST', headers: {'Content-Type':'application/json'},
        body: JSON.stringify({ id_venta: ventaDetalleActual, id_producto, cantidad: nuevaCantidad })
    })
    .then(r => r.json())
    .then(res => {
        if (res.ok) {
            verDetalle(ventaDetalleActual);
            cargarHistorial();
            cargarBalance();
        } else {
            alert('❌ ' + res.error);
        }
    });
}

function eliminarVenta(id_venta, btn) {
    if (!confirm('¿Eliminar venta #' + id_venta + '? Se restaurará el stock.')) return;
    fetch('api/eliminar_venta.php?id=' + id_venta)
        .then(r => r.json())
        .then(res => {
            if (res.ok) {
                btn.closest('tr').remove();
                cargarBalance();
            } else alert('❌ ' + res.error);
        });
}

// ========================================================
// EMPLEADO (quién está atendiendo)
// ========================================================
let empleadoActivo = null;
try { empleadoActivo = JSON.parse(sessionStorage.getItem('empleadoActivo') || 'null'); } catch(e) { empleadoActivo = null; }

function initEmpleado() {
    cargarEmpleados();
    actualizarBannerEmpleado();
    if (!empleadoActivo) {
        document.getElementById('modal-empleado').classList.add('active');
    }
}

function cargarEmpleados() {
    fetch('api/empleados.php')
        .then(r => r.json())
        .then(data => {
            const sel = document.getElementById('sel_empleado');
            sel.innerHTML = '<option value="">-- Seleccionar empleado --</option>';
            data.forEach(e => {
                const opt = document.createElement('option');
                opt.value = e.id;
                opt.textContent = e.nombre;
                sel.appendChild(opt);
            });
            if (empleadoActivo) sel.value = empleadoActivo.id;
        });
}

function confirmarEmpleado() {
    const sel = document.getElementById('sel_empleado');
    if (!sel.value) { alert('Selecciona un empleado de la lista, o añade uno nuevo.'); return; }
    const nombre = sel.options[sel.selectedIndex].textContent;
    empleadoActivo = { id: parseInt(sel.value), nombre };
    sessionStorage.setItem('empleadoActivo', JSON.stringify(empleadoActivo));
    actualizarBannerEmpleado();
    cerrarModal('modal-empleado');
}

function crearYSeleccionarEmpleado() {
    const nombre = document.getElementById('nuevo_empleado_nombre').value.trim();
    if (!nombre) { alert('Ingresa el nombre del nuevo empleado.'); return; }

    fetch('api/guardar_empleado.php', {
        method: 'POST', headers: {'Content-Type':'application/json'}, body: JSON.stringify({ nombre })
    })
    .then(r => r.json())
    .then(res => {
        if (res.ok) {
            empleadoActivo = { id: res.id, nombre: res.nombre };
            sessionStorage.setItem('empleadoActivo', JSON.stringify(empleadoActivo));
            document.getElementById('nuevo_empleado_nombre').value = '';
            cargarEmpleados();
            actualizarBannerEmpleado();
            cerrarModal('modal-empleado');
        } else alert('❌ ' + res.error);
    });
}

function actualizarBannerEmpleado() {
    const el = document.getElementById('empleado_actual');
    el.textContent = empleadoActivo ? ('👤 Atiende: ' + empleadoActivo.nombre) : '👤 Sin empleado seleccionado';
}

// ========================================================
// DASHBOARD
// ========================================================
let chartStock = null, chartVentas = null, chartVentasCat = null, chartMargen = null;
let stockAutoRefreshId = null;

function showDashTab(tab, ev) {
    document.querySelectorAll('.dash-panel').forEach(p => p.style.display = 'none');
    document.getElementById('dash-' + tab).style.display = 'block';
    document.querySelectorAll('.dash-tab-btn').forEach(b => b.classList.remove('active'));
    if (ev && ev.currentTarget) ev.currentTarget.classList.add('active');

    if (tab === 'stock')     cargarDashboardStock();
    if (tab === 'ventas')    cargarDashboardVentas();
    if (tab === 'ventascat') cargarDashboardVentasCategoria();
    if (tab === 'margen')    cargarDashboardMargen();
}

// ---------- STOCK ----------
function cargarDashboardStock() {
    const idCat = document.getElementById('stock_categoria').value;
    fetch('api/dashboard_stock.php?id_categoria=' + (idCat || ''))
        .then(r => r.json())
        .then(data => {
            const labels = data.map(p => p.id);
            const stocks = data.map(p => parseInt(p.stock));

            const ctx = document.getElementById('chart_stock');
            if (chartStock) chartStock.destroy();
            chartStock = new Chart(ctx, {
                type: 'line',
                data: {
                    labels,
                    datasets: [{
                        label: 'Stock actual',
                        data: stocks,
                        borderColor: '#4ecca3',
                        backgroundColor: 'rgba(78,204,163,0.15)',
                        tension: 0.25,
                        pointRadius: 3,
                        pointBackgroundColor: '#4ecca3',
                        fill: true
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { labels: { color: '#a0b0c8' } } },
                    scales: {
                        x: { title: { display: true, text: 'ID de Producto', color: '#a0b0c8' }, ticks: { color: '#a0b0c8', maxRotation: 90, minRotation: 90 }, grid: { color: '#1a2a4a' } },
                        y: { title: { display: true, text: 'Stock (unidades)', color: '#a0b0c8' }, ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' } }
                    }
                }
            });

            const tbody = document.getElementById('tbl_stock_body');
            tbody.innerHTML = '';
            data.forEach(p => {
                const tr = document.createElement('tr');
                tr.innerHTML = `<td>${p.id}</td><td>${p.nombre}</td><td>${p.categoria || '-'}</td><td class="num">${p.stock}</td>`;
                tbody.appendChild(tr);
            });
        });

    if (!stockAutoRefreshId) {
        stockAutoRefreshId = setInterval(() => {
            const secVisible  = document.getElementById('sec-dashboard').style.display !== 'none';
            const tabVisible  = document.getElementById('dash-stock').style.display !== 'none';
            if (secVisible && tabVisible) cargarDashboardStock();
        }, 15000);
    }
}

// ---------- VENTAS POR PERIODO ----------
const DESCRIPCIONES_PERIODO = {
    dia: 'Mostrando las ventas realizadas ese día, desglosadas por hora.',
    semana: 'Mostrando el total de ventas de cada día de la semana (Lunes a Domingo). Los días aún no transcurridos aparecen en cero.',
    mes: 'Mostrando el total de ventas de cada día del mes seleccionado. Los días futuros aparecen en cero.',
    bimestre: 'Mostrando el total de ventas de cada uno de los 2 meses del periodo.',
    trimestre: 'Mostrando el total de ventas de cada uno de los 3 meses del periodo.',
    anio: 'Mostrando el total de ventas de cada mes del año seleccionado.'
};

function cargarDashboardVentas() {
    const periodo = document.getElementById('ventas_periodo').value;
    const fecha   = document.getElementById('ventas_fecha_ref').value;
    document.getElementById('ventas_desc_periodo').textContent = DESCRIPCIONES_PERIODO[periodo] || '';

    fetch(`api/dashboard_ventas.php?periodo=${periodo}&fecha=${fecha}`)
        .then(r => r.json())
        .then(d => {
            const ctx = document.getElementById('chart_ventas');
            if (chartVentas) chartVentas.destroy();
            chartVentas = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: d.labels,
                    datasets: [{ label: 'Ventas S/', data: d.data, backgroundColor: '#e94560', borderRadius: 4 }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { labels: { color: '#a0b0c8' } } },
                    scales: {
                        x: { ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' } },
                        y: { ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' }, title: { display: true, text: 'S/', color: '#a0b0c8' } }
                    }
                }
            });
        });
}

// ---------- VENTAS POR CATEGORIA ----------
function cargarDashboardVentasCategoria() {
    const periodo = document.getElementById('ventascat_periodo').value;
    const fecha   = document.getElementById('ventascat_fecha_ref').value;

    fetch(`api/dashboard_ventas_categoria.php?periodo=${periodo}&fecha=${fecha}`)
        .then(r => r.json())
        .then(data => {
            const labels = data.map(c => c.categoria);
            const montos = data.map(c => parseFloat(c.monto));

            const ctx = document.getElementById('chart_ventascat');
            if (chartVentasCat) chartVentasCat.destroy();
            chartVentasCat = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels,
                    datasets: [{ label: 'Ventas S/ por Categoría', data: montos, backgroundColor: '#60b0ff', borderRadius: 4 }]
                },
                options: {
                    indexAxis: 'y',
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { labels: { color: '#a0b0c8' } } },
                    scales: {
                        x: { ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' } },
                        y: { ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' } }
                    }
                }
            });
        });
}

// ---------- VENTAS Y MARGEN (matriz real por categoría/producto) ----------
let margenDataCache = [];
let expandedCategoriasMargen = new Set();

function cargarDashboardMargen() {
    const periodo = document.getElementById('margen_periodo').value;
    const fecha   = document.getElementById('margen_fecha_ref').value;

    fetch(`api/dashboard_margen.php?periodo=${periodo}&fecha=${fecha}`)
        .then(r => r.json())
        .then(res => {
            margenDataCache = res.categorias;
            expandedCategoriasMargen = new Set();
            renderMatrizMargen();
            renderChartMargen();
        });
}

// Umbral de color estilo semáforo (KPI): verde = bueno, amarillo = intermedio, rojo = bajo
function claseMargen(pct) {
    if (pct >= 30) return 'kpi-green';
    if (pct >= 15) return 'kpi-yellow';
    return 'kpi-red';
}
function claseVendido(pct) {
    if (pct >= 60) return 'kpi-green';
    if (pct >= 30) return 'kpi-yellow';
    return 'kpi-red';
}

function renderMatrizMargen() {
    const tbody = document.getElementById('tbl_margen_body');
    tbody.innerHTML = '';

    margenDataCache.forEach((cat, ci) => {
        const expandida = expandedCategoriasMargen.has(ci);

        const trCat = document.createElement('tr');
        trCat.className = 'row-categoria';
        trCat.addEventListener('click', () => toggleCategoriaMargen(ci));
        trCat.innerHTML = `
            <td><strong>${expandida ? '▾' : '▸'} ${cat.categoria}</strong></td>
            <td class="num">S/ ${cat.costos.toFixed(2)}</td>
            <td class="num">S/ ${cat.ventas.toFixed(2)}</td>
            <td class="num">S/ ${cat.margen.toFixed(2)}</td>
            <td class="num ${claseMargen(cat.margen_pct)}">${cat.margen_pct.toFixed(1)}%</td>
            <td class="num">${cat.unidades}</td>
            <td class="num ${claseVendido(cat.pct_vendido)}">${cat.pct_vendido.toFixed(1)}%</td>
            <td class="num">${cat.unicos}</td>
            <td class="num">${cat.general}</td>
            <td class="num">${cat.unicos_pct.toFixed(1)}%</td>
        `;
        tbody.appendChild(trCat);

        if (expandida) {
            const productosOrdenados = cat.productos.slice().sort((a, b) => b.ventas - a.ventas);
            productosOrdenados.forEach(p => {
                const unicosP = p.unidades > 0 ? 1 : 0;
                const tr = document.createElement('tr');
                tr.className = 'row-sub';
                tr.innerHTML = `
                    <td style="padding-left:28px; color:#a0b0c8;">${p.nombre}</td>
                    <td class="num">S/ ${p.costos.toFixed(2)}</td>
                    <td class="num">S/ ${p.ventas.toFixed(2)}</td>
                    <td class="num">S/ ${p.margen.toFixed(2)}</td>
                    <td class="num ${claseMargen(p.margen_pct)}">${p.margen_pct.toFixed(1)}%</td>
                    <td class="num">${p.unidades}</td>
                    <td class="num ${claseVendido(p.pct_vendido)}">${p.pct_vendido.toFixed(1)}%</td>
                    <td class="num">${unicosP}</td>
                    <td class="num">1</td>
                    <td class="num">${(unicosP * 100).toFixed(1)}%</td>
                `;
                tbody.appendChild(tr);
            });
        }
    });
}

function toggleCategoriaMargen(ci) {
    if (expandedCategoriasMargen.has(ci)) expandedCategoriasMargen.delete(ci);
    else expandedCategoriasMargen.add(ci);
    renderMatrizMargen();
}

function renderChartMargen() {
    const labels = margenDataCache.map(c => c.categoria);
    const ventas = margenDataCache.map(c => c.ventas);
    const costos = margenDataCache.map(c => c.costos);
    const margen = margenDataCache.map(c => c.margen);

    const ctx = document.getElementById('chart_margen');
    if (chartMargen) chartMargen.destroy();
    chartMargen = new Chart(ctx, {
        type: 'bar',
        data: {
            labels,
            datasets: [
                { label: 'Ventas S/', data: ventas, backgroundColor: '#4ecca3', borderRadius: 4 },
                { label: 'Costos S/', data: costos, backgroundColor: '#e94560', borderRadius: 4 },
                { label: 'Margen S/', data: margen, backgroundColor: '#f7c948', borderRadius: 4 }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { labels: { color: '#a0b0c8' } } },
            scales: {
                x: { ticks: { color: '#a0b0c8', maxRotation: 60, minRotation: 30 }, grid: { color: '#1a2a4a' } },
                y: { ticks: { color: '#a0b0c8' }, grid: { color: '#1a2a4a' }, title: { display: true, text: 'S/', color: '#a0b0c8' } }
            }
        }
    });
}
