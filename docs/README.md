# Base de datos «epja_control»

Este directorio contiene el esquema SQL, los datos de prueba, las consultas de demostración y ejemplos de transacciones ACID que respaldan la aplicación de gestión escolar. La organización y la documentación siguen las prácticas recomendadas en proyectos de código abierto.

## 1. Contenido del directorio

| Archivo | Descripción |
|---------|-------------|
| **schema/epja_control.sql** | Definición completa de tablas (DDL) e inserciones de ejemplo |
| **queries/demo_queries.sql** | Consultas `SELECT`, combinaciones (`JOIN`) y agrupaciones (`GROUP BY`) |
| **transactions/demo_transactions.sql** | Bloque `START TRANSACTION … COMMIT` de ejemplo |
| **../diagrams/diagrama_inicial_db.png** | Diagrama conceptual inicial (PNG) |
| **../diagrams/epja_control_db.png**    | Diagrama físico/final del esquema (PNG) |

Los dos PNG se encuentran en `diagrams/` y se pueden visualizar directamente desde la interfaz web de GitHub (clic en el archivo) sin requerir complementos adicionales.


## 2. Requisitos

* **MySQL 8.0** (o MariaDB 10.6) o superior  
* Usuario con permisos para crear bases de datos y tablas  
* Consola con el cliente `mysql` disponible

## 3. Instalación rápida

```bash
# Importar esquema y datos de ejemplo
mysql -u root -p < database/schema/epja_control.sql

# Ejecutar consultas de demostración
mysql -u root -p epja_control < database/queries/demo_queries.sql
