-- Crear base de datos 
CREATE DATABASE universidad CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Modificar collation
ALTER DATABASE universidad CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Crear tabla "alumnos"
USE universidad;
CREATE TABLE alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear tabla "asignaturas"
CREATE TABLE asignaturas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear tabla "matriculas"
CREATE TABLE matriculas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT UNSIGNED,
    asignatura_id INT UNSIGNED,
    fecha_matricula DATE NOT NULL,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
    FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id)
);

-- Agregar columna "nota"
ALTER TABLE matriculas ADD COLUMN nota DECIMAL(4,2);

-- Cambiar tamaño del "nombre" en asignaturas
ALTER TABLE asignaturas MODIFY nombre VARCHAR(150) NOT NULL;

-- Eliminar columna "nota" de "matriculas"
ALTER TABLE matriculas DROP COLUMN nota;

-- Añadir índice al campo "nombre" en "asignaturas"
CREATE INDEX idx_asignatura_nombre ON asignaturas(nombre);

-- Insertar alumno "Luis Gómez"
INSERT INTO alumnos (nombre) VALUES ('Luis Gómez');

-- Añadir asignatura "Matemáticas"
INSERT INTO asignaturas (nombre) VALUES ('Matemáticas');

-- Matricular al alumno en Matemáticas con fecha de hoy
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula) 
VALUES (1, 1, CURDATE());

-- Insertar dos alumnos adicionales
INSERT INTO alumnos (nombre) VALUES ('María Fernández'), ('Carlos Ruiz');

-- Añadir tres asignaturas adicionales
INSERT INTO asignaturas (nombre) VALUES ('Física'), ('Historia'), ('Química');

-- Matricular alumnos en distintas asignaturas
    -- Luis en Física
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula) 
VALUES (1, 2, CURDATE());

    -- María en Matemáticas e Historia
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula) 
VALUES (2, 1, CURDATE()), (2, 3, CURDATE());

    -- Carlos en Química e Historia
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula) 
VALUES (3, 4, CURDATE()), (3, 3, CURDATE());

-- Consultar asignaturas de "Luis Gómez"
SELECT a.nombre AS asignatura
FROM asignaturas a
JOIN matriculas m ON a.id = m.asignatura_id
JOIN alumnos al ON m.alumno_id = al.id
WHERE al.nombre = 'Luis Gómez';

-- Consultar alumnos en "Matemáticas"
SELECT al.nombre AS alumno
FROM alumnos al
JOIN matriculas m ON al.id = m.alumno_id
JOIN asignaturas a ON m.asignatura_id = a.id
WHERE a.nombre = 'Matemáticas';

-- Eliminar inscripción de un alumno en una asignatura específica
DELETE FROM matriculas 
WHERE alumno_id = 1 AND asignatura_id = 2;

-- Eliminar un alumno y sus matrículas asociadas
DELETE FROM matriculas WHERE alumno_id = 3;
DELETE FROM alumnos WHERE id = 3;

-- Eliminar la base de datos universidad
DROP DATABASE universidad;