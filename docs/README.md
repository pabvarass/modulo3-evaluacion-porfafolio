# Base de datos «epja_control»

Este directorio contiene el esquema SQL, los datos de prueba, las consultas de demostración y ejemplos de transacciones ACID que respaldan la aplicación de gestión escolar. La organización y la documentación siguen las prácticas recomendadas en proyectos de código abierto.

## 1. Contenido del directorio

| Archivo | Descripción |
|---------|-------------|
| **schema/epja_control.sql** | Definición completa de tablas (DDL) e inserciones de ejemplo |
| **queries/demo_queries.sql** | Consultas `SELECT`, combinaciones (`JOIN`) y agrupaciones (`GROUP BY`) |
| **transactions/demo_transaction.sql** | Bloque `START TRANSACTION … COMMIT` de ejemplo |
| **../diagrams/er_diagram.md** | Diagrama Inicial y Diagrama ER  (notación pata-de-cuervo) |

GitHub renderiza los diagramas Mermaid sin complementos adicionales, lo que permite visualizar las relaciones entre tablas directamente en la web.

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
