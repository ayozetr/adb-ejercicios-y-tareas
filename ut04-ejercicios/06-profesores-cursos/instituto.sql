-- Crear la base de datos
CREATE DATABASE instituto CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Modificar el collation
ALTER DATABASE instituto CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Crear tabla "profesores"
USE instituto;
CREATE TABLE profesores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear tabla "cursos"
CREATE TABLE cursos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT
);

-- Crear tabla intermedia "profesores_cursos"
CREATE TABLE profesores_cursos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    profesor_id INT UNSIGNED,
    curso_id INT UNSIGNED,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (profesor_id) REFERENCES profesores(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- Agregar columna "horas_clase"
ALTER TABLE profesores_cursos ADD COLUMN horas_clase INT;

-- Cambiar el tamaño del campo "nombre" en la "tabla cursos"
ALTER TABLE cursos MODIFY nombre VARCHAR(200) NOT NULL;

-- Eliminar la columna horas_clase de la tabla "profesores_cursos"
ALTER TABLE profesores_cursos DROP COLUMN horas_clase;

-- Añadir índice a la columna "nombre" en "cursos"
CREATE INDEX idx_nombre ON cursos(nombre);

-- Insertar un profesor llamado "Juan Pérez"
INSERT INTO profesores (nombre) VALUES ('Juan Pérez');

-- Añadir un curso llamado "Matemáticas"
INSERT INTO cursos (nombre, descripcion) VALUES ('Matemáticas', 'Curso de álgebra y geometría');

-- Asignar el profesor "Juan Pérez" al curso "Matemáticas"
INSERT INTO profesores_cursos (profesor_id, curso_id, fecha_asignacion)
VALUES (
    (SELECT id FROM profesores WHERE nombre = 'Juan Pérez'),
    (SELECT id FROM cursos WHERE nombre = 'Matemáticas'),
    CURDATE()
);

-- Insertar dos profesores adicionales
INSERT INTO profesores (nombre) VALUES ('Ana Rodríguez'), ('Luis Gómez');

-- Añadir tres cursos adicionales
INSERT INTO cursos (nombre, descripcion) VALUES 
('Física', 'Curso de mecánica y termodinámica'),
('Historia', 'Curso de historia universal'),
('Química', 'Curso de química orgánica e inorgánica');

-- Asignar profesores a distintos cursos
INSERT INTO profesores_cursos (profesor_id, curso_id, fecha_asignacion) VALUES
(2, 2, CURDATE()), -- Ana Rodríguez enseña Física
(3, 3, CURDATE()), -- Luis Gómez enseña Historia

-- Consultar todos los cursos en los que imparte clases "Juan Pérez"
SELECT c.nombre AS curso
FROM cursos c
JOIN profesores_cursos pc ON c.id = pc.curso_id
JOIN profesores p ON pc.profesor_id = p.id
WHERE p.nombre = 'Juan Pérez';

-- Consultar todos los profesores que enseñan el curso "Matemáticas"
SELECT p.nombre AS profesor
FROM profesores p
JOIN profesores_cursos pc ON p.id = pc.profesor_id
JOIN cursos c ON pc.curso_id = c.id
WHERE c.nombre = 'Matemáticas';

-- Eliminar la asignación de un profesor en un curso específico
DELETE FROM profesores_cursos 
WHERE profesor_id = (SELECT id FROM profesores WHERE nombre = 'Luis Gómez')
AND curso_id = (SELECT id FROM cursos WHERE nombre = 'Matemáticas');

-- Eliminar un profesor y sus registros de cursos
DELETE FROM profesores_cursos WHERE profesor_id = (SELECT id FROM profesores WHERE nombre = 'Ana Rodríguez');
DELETE FROM profesores WHERE nombre = 'Ana Rodríguez';

-- Eliminar la base de datos instituto
DROP DATABASE instituto;