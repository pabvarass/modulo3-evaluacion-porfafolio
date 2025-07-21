/* ===============================
   CONSULTAS DE DEMOSTRACIÓN
   ===============================*/

/* 1. Profesor responsable de cada curso */
SELECT c.nombre   AS curso,
       f.nombre   AS profesor
FROM   cursos c
JOIN   funcionarios f ON f.id_funcionario = c.id_profesor;

/* 2. Apoderados de cada alumno */
SELECT a.nombre        AS alumno,
       ap.nombre       AS apoderado,
       ap.telefono
FROM   alumnos a
JOIN   alumno_apoderado aa ON aa.id_alumno = a.id_alumno
JOIN   apoderados ap       ON ap.id_apoderado = aa.id_apoderado
ORDER  BY a.id_alumno;

/* 3. Acciones pedagógicas con responsable */
SELECT ac.id_accion,
       ac.descripcion,
       ac.fecha,
       f.nombre  AS responsable,
       ac.estado
FROM   acciones_pedagogicas ac
JOIN   funcionarios f ON f.id_funcionario = ac.id_funcionario;

/* 4. Cursos sin alumnos (subconsulta) */
SELECT *
FROM   cursos
WHERE  id_curso NOT IN (SELECT DISTINCT id_curso FROM alumnos);

/* 5. Total de acciones por curso */
SELECT c.nombre, COUNT(ac.id_accion) AS total_acciones
FROM   cursos c
JOIN   alumnos a              USING(id_curso)
LEFT   JOIN acciones_pedagogicas ac ON ac.id_alumno = a.id_alumno
GROUP  BY c.id_curso;

/* 6. UPDATE ejemplo: cambiar e-mail de un apoderado */
UPDATE apoderados
SET email = 'fernando.perez@familia.cl'
WHERE id_apoderado = 1;

/* 7. DELETE ejemplo: eliminar una acción no realizada */
DELETE FROM acciones_pedagogicas
WHERE id_accion = 7
  AND estado = 'sin realizar';

/* 8. DELETE: elimina una acción que quedó pendiente y no se realizó */
DELETE FROM acciones_pedagogicas
WHERE id_accion = 7          -- identifica la acción concreta
  AND estado = 'sin realizar';
