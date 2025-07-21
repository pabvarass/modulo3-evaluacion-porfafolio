/* ===============================
   0) Creación y selección de BD
   ===============================*/
CREATE DATABASE IF NOT EXISTS epja_control;
USE epja_control;

/* ===============================
   1) TABLAS PRINCIPALES
   ===============================*/

/* 1.1 Funcionarios (profesores, psicólogos, etc.) */
CREATE TABLE funcionarios (
  id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  rol    ENUM('profesor','psicologo','administrativo') NOT NULL,
  email  VARCHAR(120)
);

/* 1.2 Cursos, cada uno con su profesor a cargo */
CREATE TABLE cursos (
  id_curso   INT AUTO_INCREMENT PRIMARY KEY,
  nombre     VARCHAR(40) NOT NULL,
  id_profesor INT,
  CONSTRAINT fk_profesor
    FOREIGN KEY (id_profesor)
      REFERENCES funcionarios(id_funcionario)
      ON UPDATE CASCADE
      ON DELETE RESTRICT
);

/* 1.3 Alumnos */
CREATE TABLE alumnos (
  id_alumno INT AUTO_INCREMENT PRIMARY KEY,
  nombre    VARCHAR(80) NOT NULL,
  fecha_nac DATE,
  telefono  VARCHAR(20),
  id_curso  INT,
  CONSTRAINT fk_curso
    FOREIGN KEY (id_curso)
      REFERENCES cursos(id_curso)
      ON UPDATE CASCADE
      ON DELETE RESTRICT
);

/* 1.4 Apoderados */
CREATE TABLE apoderados (
  id_apoderado INT AUTO_INCREMENT PRIMARY KEY,
  nombre   VARCHAR(80),
  telefono VARCHAR(20),
  email    VARCHAR(120)
);

/* 1.5 Relación N:M alumno-apoderado (clave compuesta) */
CREATE TABLE alumno_apoderado (
  id_alumno    INT,
  id_apoderado INT,
  PRIMARY KEY (id_alumno, id_apoderado),
  FOREIGN KEY (id_alumno)    REFERENCES alumnos(id_alumno)
        ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_apoderado) REFERENCES apoderados(id_apoderado)
        ON UPDATE CASCADE ON DELETE CASCADE
);

/* 1.6 Acciones pedagógicas (responsable = funcionario) */
CREATE TABLE acciones_pedagogicas (
  id_accion      INT AUTO_INCREMENT PRIMARY KEY,
  descripcion    TEXT NOT NULL,
  fecha          DATETIME DEFAULT CURRENT_TIMESTAMP,
  id_alumno      INT,
  id_funcionario INT,
  estado         ENUM('sin realizar','realizada') DEFAULT 'sin realizar',
  FOREIGN KEY (id_alumno)     REFERENCES alumnos(id_alumno)
        ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

/* ===============================
   2) DATOS DE EJEMPLO
   ===============================*/
INSERT INTO funcionarios(nombre,rol,email) VALUES
  ('Patricia Ríos','profesor','patricia.rios@colegio.cl'),
  ('Carlos Salas','profesor','carlos.salas@colegio.cl'),
  ('María Godoy','psicologo','m.godoy@colegio.cl');

INSERT INTO cursos(nombre,id_profesor) VALUES
  ('1° Básico A',1),
  ('1° Básico B',2);

INSERT INTO alumnos(nombre,fecha_nac,telefono,id_curso) VALUES
  ('Ana Pérez','2015-03-04','+56912345678',1),
  ('Luis Soto','2015-11-20','+56998765432',2);

INSERT INTO apoderados(nombre,telefono,email) VALUES
  ('Fernando Pérez','+56977777777','fperez@familia.cl'),
  ('Laura Díaz','+56988888888','ldiaz@familia.cl');

INSERT INTO alumno_apoderado VALUES
  (1,1),(1,2),(2,2);

INSERT INTO acciones_pedagogicas(descripcion,id_alumno,id_funcionario,estado)
VALUES ('Refuerzo lectura',1,3,'realizada');

/* ===============================
   3) TRANSACCIÓN DE DEMOSTRACIÓN
   ===============================*/
SET autocommit = 0;
START TRANSACTION;
  INSERT INTO alumnos(nombre,id_curso) VALUES ('Marcela Núñez',1);
  UPDATE cursos
    SET nombre = CONCAT(nombre,' (actualizado)')
    WHERE id_curso = 1;
COMMIT;  -- usa ROLLBACK; para deshacer

