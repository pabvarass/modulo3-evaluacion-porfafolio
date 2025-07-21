# Esquema inicial – `epja_control.sql`

Script que crea todas las tablas, claves primarias/foráneas y
carga datos de ejemplo.

```bash
mysql -u root -p < database/schema/epja_control.sql
```
Incluye:
- 6 tablas principales (funcionarios, cursos, alumnos, etc.)

- Relaciones ON UPDATE CASCADE / ON DELETE RESTRICT para garantizar integridad

- Datos semilla y una transacción ACID de demostración
