# Consultas de demostración

`demo_queries.sql` incluye ejemplos de:

- `SELECT` con **JOIN** entre _cursos_ y _funcionarios_.  
- Subconsulta para “cursos sin alumnos”.  
- Operaciones `UPDATE` y `DELETE` controladas (DML).

```bash
# Ejecutar todas las consultas de ejemplo
mysql -u root -p epja_control < database/queries/demo_queries.sql
