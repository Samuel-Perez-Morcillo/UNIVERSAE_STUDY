DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo;
USE zoo;

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



select a.nombre as animal, e.nombre as especie
from Animales a join
Especies e On a.idEspecie = e.idEspecie

