/*
• Se plantean diferentes ejercicios para practicar con sentencias DML y DCL.
• Es necesario disponer de un servidor de base de datos (MySQL o MariaDB) y un
cliente gráfico.
• Puede existir diferentes soluciones en un ejercicio. Hay que encontrar la solución
más efectiva y eficiente.
• La estructura de la base de datos es la siguiente:
*/
Drop database if exists Pedidos;
CREATE DATABASE Pedidos;
USE pedidos;
CREATE TABLE CLIENTES (
idCliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
telefono VARCHAR(20),
direccion VARCHAR(255)
);
CREATE TABLE CATEGORIAS (
idCategoria INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
descripcion TEXT
);
CREATE TABLE PRODUCTOS (
idProducto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
descripcion TEXT,
precio DECIMAL(10,2) NOT NULL,
idCategoria INT,
FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria)
);
CREATE TABLE PEDIDOS (
idPedido INT AUTO_INCREMENT PRIMARY KEY,
idCliente INT NOT NULL,
fecha DATETIME NOT NULL,
total DECIMAL(10,2),
FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);
CREATE TABLE LINEAS_PEDIDOS (
idLineaPedido INT,
idPedido INT,
idProducto INT,
cantidad INT NOT NULL,
precioUnitario DECIMAL(10,2) NOT NULL,
descuento DECIMAL(10,2) NOT NULL,
total DECIMAL(10,2) NOT NULL,
PRIMARY KEY (idLineaPedido, idPedido, idProducto),
FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido),
FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);

#Ejercicio 1 . Realiza la carga de Datos
-- Categorias
INSERT INTO CATEGORIAS (nombre, descripcion) VALUES ('Electrónica', 'Productos electrónicos y
dispositivos');
INSERT INTO CATEGORIAS (nombre, descripcion) VALUES ('Ropa', 'Ropa y accesorios');
INSERT INTO CATEGORIAS (nombre, descripcion) VALUES ('Juguetes', 'Juguetes y juegos para niños y
adultos');
INSERT INTO CATEGORIAS (nombre, descripcion) VALUES ('Libros', 'Libros de diferentes géneros,
incluidos ficción, no ficción, educativos y más.');
INSERT INTO CATEGORIAS (nombre, descripcion) VALUES ('Juguetes', 'Juguetes y juegos para niños y
adultos');
INSERT INTO CATEGORIAS (nombre, descripcion) VALUES ('Hogar', 'Artículos para el hogar');
INSERT INTO CATEGORIAS (nombre, descripcion) VALUES ('Deportes', 'Productos y accesorios
relacionados con deportes y actividades al aire libre.');
INSERT INTO CATEGORIAS (nombre, descripcion) VALUES ('Electrónica', 'Productos electrónicos y
dispositivos');
-- Clientes
INSERT INTO CLIENTES (nombre, apellido, email, telefono, direccion) VALUES ('Juan', 'Pérez',
'juan.perez@email.com', '+1234567890', 'Calle 123, Ciudad A');
INSERT INTO CLIENTES (nombre, apellido, email, telefono, direccion) VALUES ('María', 'González',
'maria.gonzalez@email.com', '+2345678901', 'Avenida 456, Ciudad B');
INSERT INTO CLIENTES (nombre, apellido, email, telefono, direccion) VALUES ('Carlos', 'Ramírez',
'carlos.ramirez@email.com', '+3456789012', 'Calle 789, Ciudad C');
INSERT INTO CLIENTES (nombre, apellido, email, telefono, direccion) VALUES ('Ana', 'Rodríguez',
'ana.rodriguez@email.com', '+4567890123', 'Avenida 321, Ciudad D');
INSERT INTO CLIENTES (nombre, apellido, email, telefono, direccion) VALUES ('Pedro', 'López',
'pedro.lopez@email.com', '+5678901234', 'Calle 654, Ciudad E');
-- Productos
INSERT INTO PRODUCTOS (nombre, descripcion, precio, idCategoria) VALUES ('Camiseta Marvel',
'Camiseta con estampado de personajes de Marvel', 19.99, 2);
INSERT INTO PRODUCTOS (nombre, descripcion, precio, idCategoria) VALUES ('Taza de café de
Friends', 'Taza de café con el logo de Central Perk de la serie Friends', 12.99, 5);
INSERT INTO PRODUCTOS (nombre, descripcion, precio, idCategoria) VALUES ('Póster Pulp Fiction',
'Póster de la icónica película Pulp Fiction de Quentin Tarantino', 14.99, 3);
INSERT INTO PRODUCTOS (nombre, descripcion, precio, idCategoria) VALUES ('Funko Pop de Star
Wars', 'Figura coleccionable Funko Pop de un personaje de Star Wars', 24.99, 3);
INSERT INTO PRODUCTOS (nombre, descripcion, precio, idCategoria) VALUES ('Libro de cocina de
películas', 'Libro de cocina con recetas inspiradas en películas famosas', 29.99, 4);
INSERT INTO PRODUCTOS (nombre, descripcion, precio, idCategoria) VALUES ('Peluche de Toy Story',
'Peluche de un personaje de la película animada Toy Story', 34.99, 3);





---------------------------------------------
# a) Pon una captura donde se vean todas las categorías. ¿Existen categorías repetidas?

select * 
from categorias;

select nombre as nombre_categoria, count(*) as veces_aparece
from categorias
group by nombre
having count(*) > 1;


# Muestra solo una categoria de cada tipo
select distinct nombre from categorias;


# Revisa que cada categoria tiene el identificador como marca la siguiente tabla sino realiza los cambios oportunos
SELECT nombre, MIN(idCategoria) AS idCategoria
FROM categorias
GROUP BY nombre;


-- Una vez realizada la comprobacion detectamos que deberemos cambiar el identificador de Hogar y de deportes
SET SQL_SAFE_UPDATES = 0;

UPDATE categorias
SET idCategoria = 99
WHERE nombre = 'Deportes';

UPDATE categorias
SET idCategoria = 100
WHERE idCategoria = 5;

UPDATE categorias
SET idCategoria = 5
WHERE idCategoria = 99;

UPDATE categorias
SET idCategoria = 7  -- o cualquier ID que quieras asignar
WHERE idCategoria = 100;

SET SQL_SAFE_UPDATES = 1;


