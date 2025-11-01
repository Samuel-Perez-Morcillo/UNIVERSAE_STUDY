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
)

