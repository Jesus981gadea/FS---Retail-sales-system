# Sistema de Gestión Comercial – Distribuidora FS

## Contexto

Cuando ingresé a la distribuidora FS, el cierre de mes tomaba 3 horas. Las ventas, compras y stock estaban aislados en hojas de cálculo sin ningún tipo de integración, lo que imposibilitaba calcular la rotación de inventario y el margen real de cada producto. Las decisiones de compra se tomaban por intuición, no por datos.

## Solución

Lideré un análisis completo de la arquitectura de datos y diseñé desde cero un Sistema de Gestión Comercial full-stack utilizando PHP, MySQL y JavaScript. El sistema centralizó toda la información operativa en una base de datos relacional única.

Construí un pipeline ETL/ELT en Python para estandarizar formatos y eliminar duplicados en los registros diarios, logrando reducir los errores de carga en más de un 40%.

Sobre esta base, implementé un dashboard en Power BI con KPIs en tiempo real: ventas, márgenes, rotación de inventario y quiebres de stock. Este tablero fue adoptado por la gerencia para la toma de decisiones semanales.

## Decisión estratégica

El análisis visual del dashboard reveló que la categoría "cables en rollos" tenía el margen más alto del negocio, pero presentaba quiebres de inventario constantes. Con esta evidencia, priorizamos la reposición de esta categoría, reemplazando la intuición por un enfoque basado en datos.

## Resultados

El cierre mensual se redujo de 3 horas a 20 minutos. Los errores en los registros disminuyeron en un 40%. En 12 meses, los ingresos del área retail aumentaron un 25%.

## Estado actual (2026)

Actualmente estoy incorporando modelos de machine learning para previsión de demanda, con el objetivo de anticipar quiebres de stock y optimizar las compras. El sistema sigue en evolución y se está adaptando a las necesidades del sector ferretero en Perú.

---

En Perú, 7 de cada 10 distribuidoras ferreteras y de limpieza aún operan sin automatización. Este proyecto demuestra que la integración de datos y el análisis predictivo no solo optimizan procesos, sino que impactan directamente en la rentabilidad del negocio.
