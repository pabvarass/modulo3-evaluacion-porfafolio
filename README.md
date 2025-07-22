# Módulo 3 · Evaluación de Portafolio

Este repositorio centraliza **la solución completa** al proyecto de base de datos relacional y consultas SQL para el Módulo 3.

**Incluye:**
* Esquema relacional en MySQL (DDL + datos de muestra).  
* Consultas `SELECT`, agregaciones y subconsultas.  
* Transacciones ACID de ejemplo.  
* Diagramas ER (conceptual y físico) en formato PNG.  
* Documentación paso a paso.

***

---

## Estructura de archivos

```text
database/
 ├─ schema/epja_control.sql          # DDL + datos de ejemplo
 ├─ queries/demo_queries.sql         # SELECT, UPDATE, DELETE
 └─ transactions/demo_transactions.sql   # Transacción ACID
diagrams/
 ├─ diagrama_inicial_db.png          # ER conceptual
 └─ epja_control_db.png              # ER físico
docs/
 └─ README.md                     # Guía técnica detallada
README.md                            # Este archivo

---

## Instalación Rápida

1.  Clona el repositorio:
    ```bash
    git clone [https://github.com/pabvarass/modulo3-evaluacion-porfafolio.git](https://github.com/pabvarass/modulo3-evaluacion-porfafolio.git)
    cd modulo3-evaluacion-porfafolio
    ```
2.  Importa el esquema y los datos iniciales en tu base de datos. Se te pedirá la contraseña de `root`.
    ```bash
    # Crea la base de datos e importa el esquema
    mysql -u root -p < database/schema/epja_control.sql
    ```
3.  Ejecuta las consultas de demostración:
    ```bash
    # Usa la base de datos epja_control para ejecutar las consultas
    mysql -u root -p epja_control < database/queries/demo_queries.sql
    ```
> **Nota**: El cliente de MySQL permite ejecutar scripts directamente usando la redirección de entrada (`<`).

***

## Requisitos

* **Base de Datos**: MySQL 8.0+ o MariaDB 10.6+
* **Terminal**: Bash o PowerShell con `git` y `mysql` instalados.
* **Editor**: VS Code con la extensión de Mermaid (opcional, para previsualizar diagramas).
* **Control de Versiones**: Una cuenta de GitHub.

***

## Claves de Diseño

* **Integridad Referencial**: Se utilizan claves primarias y foráneas con acciones `CASCADE` y `RESTRICT` para garantizar la consistencia de los datos.
* **Tipos de Datos**: Se usa el tipo `ENUM` para validar valores en campos específicos (ej. roles de funcionario), evitando datos incorrectos.
* **Normalización**: El esquema sigue la Tercera Forma Normal (3NF) para minimizar la redundancia de datos.
* **Control de Versiones**: El historial de Git sigue la especificación de *Conventional Commits* para mayor claridad.


---

###  Más información
Para detalles técnicos y guía de instalación paso a paso, revisa **[docs/README.md](docs/README.md)**.

