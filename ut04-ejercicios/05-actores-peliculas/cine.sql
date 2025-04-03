-- Creación de la base de datos
CREATE DATABASE cine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Cambiar el collation
ALTER DATABASE cine CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Crear tabla actores
USE cine;
CREATE TABLE actores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear tabla peliculas
CREATE TABLE peliculas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_estreno YEAR NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear tabla intermedia "actores_peliculas"
CREATE TABLE actores_peliculas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    actor_id INT UNSIGNED NOT NULL,
    pelicula_id INT UNSIGNED NOT NULL,
    personaje VARCHAR(100) NOT NULL,
    FOREIGN KEY (actor_id) REFERENCES actores(id),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Modificar tabla "actores_peliculas" para agregar columna "salario"
ALTER TABLE actores_peliculas ADD COLUMN salario DECIMAL(10,2);

-- Cambiar el tamaño del campo "nombre" en la tabla "actores"
ALTER TABLE actores MODIFY nombre VARCHAR(150) NOT NULL;

-- Eliminar la columna "salario" de "actores_peliculas"
ALTER TABLE actores_peliculas DROP COLUMN salario;

-- Añadir índice a la columna "titulo" en "peliculas"
CREATE INDEX idx_titulo ON peliculas(titulo);

-- Insertar actor "Leonardo DiCaprio"
INSERT INTO actores (nombre) VALUES ('Leonardo DiCaprio');

-- Añadir película "Titanic"
INSERT INTO peliculas (titulo, anio_estreno) VALUES ('Titanic', 1997);

-- Registrar participación de "Leonardo DiCaprio" en "Titanic"
INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje)
VALUES (
    (SELECT id FROM actores WHERE nombre = 'Leonardo DiCaprio'),
    (SELECT id FROM peliculas WHERE titulo = 'Titanic'),
    'Jack Dawson'
);

-- Insertar dos actores adicionales
INSERT INTO actores (nombre) VALUES ('Kate Winslet'), ('Tom Hanks');

-- Añadir tres películas adicionales
INSERT INTO peliculas (titulo, anio_estreno) VALUES 
('Forrest Gump', 1994),
('Avatar', 2009),
('Inception', 2010);

-- Registrar participación de actores en películas
INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje) VALUES
((SELECT id FROM actores WHERE nombre = 'Kate Winslet'), (SELECT id FROM peliculas WHERE titulo = 'Titanic'), 'Rose DeWitt Bukater'),
((SELECT id FROM actores WHERE nombre = 'Tom Hanks'), (SELECT id FROM peliculas WHERE titulo = 'Forrest Gump'), 'Forrest Gump'),
((SELECT id FROM actores WHERE nombre = 'Leonardo DiCaprio'), (SELECT id FROM peliculas WHERE titulo = 'Inception'), 'Dom Cobb');

-- Consultar todas las películas de "Leonardo DiCaprio"
SELECT p.titulo, p.anio_estreno, ap.personaje
FROM peliculas p
JOIN actores_peliculas ap ON p.id = ap.pelicula_id
JOIN actores a ON ap.actor_id = a.id
WHERE a.nombre = 'Leonardo DiCaprio';

-- Consultar todos los actores que participaron en "Titanic"
SELECT a.nombre, ap.personaje
FROM actores a
JOIN actores_peliculas ap ON a.id = ap.actor_id
JOIN peliculas p ON ap.pelicula_id = p.id
WHERE p.titulo = 'Titanic';

-- Eliminar participación de un actor en una película específica
DELETE FROM actores_peliculas
WHERE actor_id = (SELECT id FROM actores WHERE nombre = 'Tom Hanks')
AND pelicula_id = (SELECT id FROM peliculas WHERE titulo = 'Forrest Gump');

-- Eliminar un actor y sus registros de películas
DELETE FROM actores_peliculas
WHERE actor_id = (SELECT id FROM actores WHERE nombre = 'Kate Winslet');
DELETE FROM actores WHERE nombre = 'Kate Winslet';

-- Eliminar la base de datos
DROP DATABASE cine;