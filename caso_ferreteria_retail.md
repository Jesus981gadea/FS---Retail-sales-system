# Análisis de Ventas y Margen por Categoría — Distribuidora Ferretera

**Industria:** Retail / Ferretería
**Fuente:** Sistema de gestión propio del negocio (módulo Dashboard)
**Periodo analizado:** Julio 2025

---

## 1. Problema

La distribuidora maneja más de 40 categorías de producto (pinturas, caños, pegamentos, químicos, herramientas, eléctrico, etc.) sin visibilidad clara de cuáles generan la rentabilidad real del negocio. Al ser una pyme con capital de trabajo limitado, no se puede invertir en stock de todas las categorías por igual.

**Pregunta de negocio:** ¿en qué categorías conviene concentrar compras e inventario, y cuáles están consumiendo espacio y capital sin retorno?

---

## 2. Datos

- **Origen:** módulos de Ventas, Compras, Gastos, Balance e Historial del sistema propio — datos transaccionales reales.
- **Variables:** costo, ventas (S/), margen (S/ y %), unidades vendidas, % vendido, compradores únicos, clientes totales por categoría, % de únicos.
- **Limitación conocida:** el costo es **estimado al 65% del precio de venta**, porque el catálogo no registra costo real por producto. Ventas, unidades y % vendido sí son datos reales del período.

---

## 3. Conclusiones

### a) Concentración tipo "long tail"
Pinturas, Caños, Pegamentos, Químicos y Aerosoles concentran la mayor parte de las ventas del mes. Después de esas 5 categorías, el gráfico cae en una cola larga de ~30 categorías con ventas marginales (Clavos, Brocas, Armellas, Cerrojos, Empaquetaduras, etc.).

**→ Decisión:** priorizar compras e inventario en las 5 categorías top; evaluar si vale sostener stock en la cola larga o consolidarla.

### b) Stock muerto dentro de la categoría líder
Dentro de Pinturas —la categoría #1 en ventas— varios productos (Temple 25kg Losaro, Temple 25kg Perucolor, Temple 5kg en tres marcas, Gloss Gln Losaro, Base al Aceite) registran **S/0.00 en ventas y 0% vendido** en el período, pese a estar catalogados.

**→ Decisión:** evaluar si son productos para liquidar, descontinuar, o si hay un problema de exhibición/disponibilidad.

### c) Margen % uniforme = señal de alerta en la calidad del dato
Todas las categorías muestran un margen muy similar (~34-35%): Pinturas 35.0%, Caños 35.0%, Pegamentos 35.0%, Químicos 34.5%, Aerosoles 35.0%. Esto no es casualidad de mercado: es el resultado matemático esperable cuando el costo se calcula como 65% fijo del precio de venta para todos los productos.

**→ Decisión:** antes de tomar decisiones de pricing o mix de producto basadas en margen, cargar el costo real por producto. Es la mejora de datos con mayor impacto posible.

### d) Alcance vs. profundidad de cliente
El "único %" varía fuerte entre categorías: Aerosoles tiene 80% (casi todo el que pasa por ahí termina comprando), mientras que Pinturas solo 22.2% (mucho tráfico/consulta, pero baja conversión a compra).

**→ Decisión:** investigar por qué Pinturas convierte tan poco pese a ser la categoría de mayor venta — posible fricción de precio, falta de color/marca específica, o ticket alto que retrae la decisión de compra.

---

## Resumen ejecutivo

El 35% de margen reportado por categoría es un artefacto de un supuesto de costeo uniforme, no rentabilidad real. Se priorizó un rediseño de compras en base a las 5 categorías que concentran las ventas reales, y se detectaron SKUs con stock muerto dentro de la categoría líder (Pinturas), además de una brecha de conversión que amerita investigación adicional.
