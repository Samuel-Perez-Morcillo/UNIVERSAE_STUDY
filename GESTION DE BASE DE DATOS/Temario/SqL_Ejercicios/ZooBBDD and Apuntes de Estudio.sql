# Aqui Aprenderemos a generar una base de datos y sus respectivas consultas

drop database if exists zoo;
create database zoo;
use zoo;

create table Especies(
	idEspecie int auto_increment primary key,
	nombre varchar(255) not null,
	nombreCientifico varchar(255) unique not null,
	familia varchar(255)
);

create table Habitats(
	idHabitat int auto_increment primary key,
    nombre varchar(255) not null,
    descripcion text,
    capacidad int not null
);

create table Animales(
	idAnimal int auto_increment primary key,
    nombre varchar(255) not null,
    fechaNacimiento datetime not null,
    genero varchar(20),
    idEspecie int not null,
    idHabitat int not null,
    foreign key (idEspecie) references Especies(idEspecie),
    foreign key (idHabitat) references Habitats(idHabitat)
);

create table cuidadores(
	idCuidador int auto_increment primary key,
    nombre varchar(255) not null,
    apellidos varchar(255) not null,
    email varchar(255) unique,
    telefono varchar(20) not null
);

create table Asignaciones(
	idAnimal int,
    idCuidador int,
    fechaInicio datetime not null,
    fechaFin datetime not null,
    Primary Key (idAnimal,idCuidador),
    FOREIGN KEY (idAnimal) REFERENCES Animales(idAnimal),
    FOREIGN KEY (idCuidador) REFERENCES Cuidadores(idCuidador)
);
------------

INSERT INTO Especies (nombre, nombreCientifico, familia)
VALUES
('León', 'Panthera leo', 'Felidae'),
('Tigre', 'Panthera tigris', 'Felidae'),
('Elefante africano', 'Loxodonta africana', 'Elephantidae'),
('Jirafa', 'Giraffa camelopardalis', 'Giraffidae');

INSERT INTO Habitats (nombre, descripcion, capacidad)
VALUES
('Sabana', 'Zona amplia con hierba y árboles dispersos', 10),
('Selva', 'Área húmeda y densa con árboles altos', 8),
('Pradera', 'Zona abierta con hierba abundante', 12),
('Zona Acuática', 'Área con estanques y ríos pequeños', 6);


INSERT INTO Animales (nombre, fechaNacimiento, genero, idEspecie, idHabitat)
VALUES
('Simba', '2018-05-12', 'Macho', 1, 1),
('Nala', '2019-07-21', 'Hembra', 1, 1),
('Shere Khan', '2017-03-02', 'Macho', 2, 2),
('Dumbo', '2020-09-15', 'Macho', 3, 3),
('Melman', '2016-11-30', 'Macho', 4, 3);


INSERT INTO Cuidadores (nombre, apellidos, email, telefono)
VALUES
('Laura', 'García', 'laura@zoo.com', '600111222'),
('Carlos', 'Pérez', 'carlos@zoo.com', '600333444'),
('Ana', 'Martín', 'ana@zoo.com', '600555666');

INSERT INTO Asignaciones (idAnimal, idCuidador, fechaInicio, fechaFin)
VALUES
(1, 1, '2025-01-01', '2025-12-31'),
(2, 1, '2025-02-01', '2025-12-31'),
(3, 2, '2025-03-01', '2025-12-31'),
(4, 3, '2025-04-01', '2025-12-31'),
(5, 2, '2025-05-01', '2025-12-31');

----------------------
-- Ejercicios de Practica del Select

select nombre,familia from Especies;

select * from Animales 
where genero = 'hembra';

select * from animales
where idHabitat=1 or idHabitat=2; -- Es importante destacar que And se tienen que dar los dos casos para que se muestre y que con Or solo se necesita que se de uno

select * from animales 
where not genero='macho';


select nombre,fechaNacimiento from Animales
where fechaNacimiento between '2018-01-01' and '2020-12-31';


# Una tecnica interesante para realizar busquedas es el LIKE %

select * from Especies
where nombre like 'E%'; -- Quiere decir que empieza por E

select * from especies
where nombre like '%ra'; -- Contiene ra en culquier parte

# Es importante ordenar y para ello usaremos el Order By

select nombre,fechaNacimiento from animales
order by fechaNacimiento asc;

# Muchas veces es importante unir tablaas para poder mostrar de manera entendible los datos que tenemos (JOIN)

select a.nombre as nombreAnimal,a.fechaNacimiento, e.nombre as especie
from Animales a
Join Especies e on a.idEspecie=e.idEspecie;

# Podemos Utilizar Count para contar

select count(*) as total_animales from animales;

# Podemos utililzar AVG para calcular la media

select round(AVG(capacidad)) as capacidad_media from habitats;

# Podremos realizar agrupaciones

select h.nombre as habitat, count(a.idAnimal) as total_animales
from animales a
join Habitats h on a.idHabitat =h.idHabitat
group by h.nombre;


# Having. Es muy parecido al where pero se usa justo despues de realizar una agrupacion

select h.nombre as habitat, count(a.idAnimal) as total_animales
from animales a 
join habitats h on a.idHabitat=h.idHabitat
group by h.nombre
having count(a.idAnimal) > 1;

# Tambien podremos realizar lo conocido como Subconsultas

select nombre as entorno, capacidad as capacidad_total
from habitats
where capacidad > (select avg(capacidad) from habitats);

# Podremos Realizar un INNER JOIN que sirve para localizar aquellos campos que forman parte de dos o mas tablas
# Solo se mostraran aquellos datos que sean comunes a las tablas comparadas

select
a.nombre as nombreAnimal,
a.fechaNacimiento as fecha_de_Nacimiento,
e.nombre as especie,
h.nombre as habitat
from animales a 
inner Join especies e on a.idEspecie=e.idEspecie
inner join habitats h on a.idHabitat= h.idHabitat;

# Tambien podremos realizar actualizaciones de las tablas con Update

Update especies
set nombre= 'Charmander'
where idEspecie = 1;

select *
from especies;

# Podremos usar el comando Delete para eliminar registros
# Hay que tener cuidado porque en caso de no especificar una condicion se eliminaran todos los registros 

delete from especies
where idEspecie=1;


# 