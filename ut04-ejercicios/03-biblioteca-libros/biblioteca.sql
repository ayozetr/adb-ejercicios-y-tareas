-- Crear base de datos
CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Modificar collation
ALTER DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Crear tabla bibliotecas
USE biblioteca;
CREATE TABLE bibliotecas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear tabla libros
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    biblioteca_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion YEAR NOT NULL,
    FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Agregar columna "genero"
ALTER TABLE libros ADD COLUMN genero VARCHAR(50);

-- Cambiar tamaño de "nombre" a 150 caracteres
ALTER TABLE bibliotecas MODIFY nombre VARCHAR(150) NOT NULL;

-- Eliminar columna "genero" de libros
ALTER TABLE libros DROP COLUMN genero;

-- Añadir columna "isbn" después de "titulo"
ALTER TABLE libros ADD COLUMN isbn VARCHAR(20) AFTER titulo;

-- Cambiar tipo de dato de "isbn"" a CHAR(13)
ALTER TABLE libros MODIFY isbn CHAR(13);

-- Insertar una biblioteca llamada "Biblioteca Central"
INSERT INTO bibliotecas (nombre) VALUES ('Biblioteca Central');

-- Añadir el "El Quijote" de "Miguel de Cervantes" en la "Biblioteca Central"
INSERT INTO libros (biblioteca_id, titulo, isbn, autor, anio_publicacion)
VALUES (1, 'El Quijote', '9781234567890', 'Miguel de Cervantes', 1605);

-- Registrar dos libros adicionales
INSERT INTO libros (biblioteca_id, titulo, isbn, autor, anio_publicacion)
VALUES 
    (1, '1984', '9780451524935', 'George Orwell', 1949),
    (1, 'Cien años de soledad', '9780307474728', 'Gabriel García Márquez', 1967);

-- Consultar todos los libros
SELECT l.*, b.nombre AS biblioteca 
FROM libros l 
JOIN bibliotecas b ON l.biblioteca_id = b.id;

-- Mostrar todas las bibliotecas sin libros registrados
SELECT b.* 
FROM bibliotecas b 
LEFT JOIN libros l ON b.id = l.biblioteca_id 
WHERE l.id IS NULL;

-- Actualizar el año de publicación de "1984" a "1950"
UPDATE libros 
SET anio_publicacion = 1950 
WHERE titulo = '1984' AND autor = 'George Orwell';

-- Eliminar un libro con id = 1
DELETE FROM libros WHERE id = 1;

-- Eliminar la Biblioteca Central y todos sus libros (usando ON DELETE CASCADE)
ALTER TABLE libros DROP FOREIGN KEY libros_ibfk_1;
ALTER TABLE libros ADD CONSTRAINT fk_biblioteca 
    FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(id) ON DELETE CASCADE;
DELETE FROM bibliotecas WHERE id = 1;

-- Consultar la estructura de la tabla libros
DESCRIBE libros;

-- Eliminar las tablas
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS bibliotecas;

-- Eliminar la base de datos
DROP DATABASE biblioteca;