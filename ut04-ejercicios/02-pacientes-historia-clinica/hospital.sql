-- Crear la base de datos
CREATE DATABASE hospital CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Cambiar el collation
ALTER DATABASE hospital CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Crear tabla "pacientes"
USE hospital;
CREATE TABLE pacientes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear tabla "historias_clinicas"
CREATE TABLE historias_clinicas (
    paciente_id INT UNSIGNED PRIMARY KEY,
    diagnostico TEXT NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id) ON DELETE CASCADE
);

-- Agregar columna "tratamiento"
ALTER TABLE historias_clinicas ADD COLUMN tratamiento TEXT;

-- Cambiar el tamaño del campo "nombre" a 150 caracteres
ALTER TABLE pacientes MODIFY nombre VARCHAR(150) NOT NULL;

-- Agregar columna "telefono" después del campo "nombre"
ALTER TABLE pacientes ADD COLUMN telefono VARCHAR(15) AFTER nombre;

-- Cambiar el tipo de dato de "telefono" a "BIGINT"
ALTER TABLE pacientes MODIFY telefono BIGINT;

-- Eliminar la columna "telefono"
ALTER TABLE pacientes DROP COLUMN telefono;

-- Insertar un paciente llamado "Juan Pérez"
INSERT INTO pacientes (nombre) VALUES ('Juan Pérez');

-- Insertar historia clínica para "Juan Pérez"
INSERT INTO historias_clinicas (paciente_id, diagnostico) 
VALUES (LAST_INSERT_ID(), 'Hipertensión');

-- Insertar dos pacientes adicionales
INSERT INTO pacientes (nombre) VALUES ('Ana Gómez'), ('Carlos Ruiz');

-- Añadir historias clínicas para los nuevos pacientes
INSERT INTO historias_clinicas (paciente_id, diagnostico) 
VALUES 
    ((SELECT id FROM pacientes WHERE nombre = 'Ana Gómez'), 'Diabetes tipo 2'),
    ((SELECT id FROM pacientes WHERE nombre = 'Carlos Ruiz'), 'Asma leve');

-- Consultar todas las historias clínicas con el nombre del paciente
SELECT p.nombre, h.diagnostico, h.fecha_registro, h.tratamiento
FROM pacientes p
JOIN historias_clinicas h ON p.id = h.paciente_id;

-- Mostrar pacientes que no tienen historia clínica registrada
SELECT p.nombre
FROM pacientes p
LEFT JOIN historias_clinicas h ON p.id = h.paciente_id
WHERE h.paciente_id IS NULL;

-- Actualizar el diagnóstico de "Juan Pérez"
UPDATE historias_clinicas 
SET diagnostico = 'Hipertensión crónica'
WHERE paciente_id = (SELECT id FROM pacientes WHERE nombre = 'Juan Pérez');

-- Eliminar la historia clínica de "Carlos Ruiz"
DELETE FROM historias_clinicas 
WHERE paciente_id = (SELECT id FROM pacientes WHERE nombre = 'Carlos Ruiz');

-- Consultar la estructura de la tabla "historias_clinicas"
DESCRIBE historias_clinicas;

-- Eliminar las tablas 
DROP TABLE historias_clinicas;
DROP TABLE pacientes;

-- Eliminar la base de datos
DROP DATABASE hospital;