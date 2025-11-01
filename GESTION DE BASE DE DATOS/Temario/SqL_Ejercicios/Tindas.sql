DROP DATABASE IF EXISTS tienda;
create database tienda;
use tienda;




create table Clientes(
	cliente_id int auto_increment primary key,
	nombre varchar(255) not null,
	apellido varchar(255) not null,
	email varchar(255) unique not null,
	telefono varchar(20) not null,
	direccion varchar(255) not null
);

create table Categorias(
	categoria_id int auto_increment primary key,
	nombre varchar(255) not null, 
	descripcion text
);

create table Productos(
	producto_id int auto_increment primary key,
	nombre varchar(255) not null,
	descripcion text,
	precio decimal(10,2) not null,
	categoria_id int,
	foreign key (categoria_id) references Categorias(categoria_id)
);

create table Pedidos(
	pedido_id int auto_increment primary key,
    cliente_id int not null,
    fecha datetime not null,
    total decimal(10,2),
    foreign key (cliente_id) references Clientes(cliente_id)
);

create table Linea_Pedidos(
	linea_pedido_id int,
    pedido_id int not null,
    producto_id int not null,
    cantidad int not null,
    precio_unitario decimal(10,2) not null,
    descuento decimal(10,2) not null,
    primary key (linea_pedido_id, pedido_id, producto_id),
    foreign key (pedido_id) references Pedidos(pedido_id),
    foreign key (producto_id) references Productos(producto_id)
);


    
    