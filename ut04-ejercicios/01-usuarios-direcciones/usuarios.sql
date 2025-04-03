-- Crear base de datos
CREATE DATABASE IF NOT EXISTS usuarios_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Cambiar collation
ALTER DATABASE usuarios_db COLLATE utf8mb4_general_ci;

-- Crear tabla "usuarios"
USE usuarios_db;
CREATE TABLE IF NOT EXISTS usuarios (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear tabla "direcciones"
CREATE TABLE IF NOT EXISTS direcciones (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    direccion VARCHAR(255) NOT NULL
);

-- Convertir "usuario_id" en PK y FK a la vez.
USE usuarios_db;
ALTER TABLE direcciones MODIFY id INT UNSIGNED;
ALTER TABLE direcciones DROP PRIMARY KEY;
ALTER TABLE direcciones ADD PRIMARY KEY(usuario_id);

-- Aumentar tamaño del campo "nombre" a 150 caracteres
USE usuarios_db;
ALTER TABLE usuarios MODIFY nombre VARCHAR(150) NOT NULL;

-- Añadir columna "telefono" de tipo "VARCHAR(15)"" despues de columna "nombre"
USE usuarios_db;
ALTER TABLE usuarios ADD telefono VARCHAR(15) AFTER nombre;

-- Cambiar el tipo de datos del campo "telefono" a tipo "BIGINT"
USE usuarios_db; 
ALTER TABLE usuarios MODIFY telefono BIGINT;

-- Eliminar columna "telefono"
USE usuarios_db;
ALTER TABLE usuarios DROP telefono;

-- Insertar usuario "Juan Pérez"
USE usuarios_db;
INSERT INTO usuarios (nombre)
VALUES ('Juan Pérez');

-- Insertar dirección para Juan Pérez
USE usuarios_db;
INSERT INTO direcciones (usuario_id, direccion)
VALUES (1, "Calle Mayor 123");

-- Insertar dos usuarios adicionales
USE usuarios_db;
INSERT INTO usuarios (nombre)
VALUES ("Ana Gómez"),
	   ("Carlos Ruiz");

-- Añade direcciones para los nuevos usuarios
USE usuarios_db;
INSERT INTO direcciones (usuario_id, direccion)
VALUES (2, "Calle Menor 456"),
       (3, "Calle Mediana 789");

-- Consultar todas las direcciones con el nombre del usuario
USE usuarios_db;
SELECT * FROM direcciones;
SELECT * FROM usuarios;

-- Mostrar usuarios que no tienen dirección registrada
SELECT u.* 
FROM usuarios u
LEFT JOIN direcciones d ON u.id = d.usuario_id
WHERE d.usuario_id IS NULL;

-- Actualizar dirección de "Juan Pérez"
USE usuarios_db;
UPDATE direcciones SET direccion = 'Avenida Central 456' WHERE usuario_id = 1;

-- Elimina dirección de "Carlos Ruiz"
USE usuarios_db;
DELETE FROM direcciones WHERE usuario_id = 3;

-- Consultar estructura de la tabla "direcciones"
USE usuarios_db;
DESCRIBE direcciones;

-- Eliminar las tablas
USE usuarios_db;
DROP TABLE IF EXISTS direcciones, usuarios;

-- Eliminar la base de datos
USE usuarios_db;
DROP DATABASE IF EXISTS usuarios_db;