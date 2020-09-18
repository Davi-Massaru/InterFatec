create database library_ecommerce
go

use library_ecommerce
go

create table people
(
	uuid char(32) not null primary key, -- change to uuid
	name varchar(50) not null,
	cpf char(12) not null unique, -- sem pontuacao
	birth date not null,
	login varchar(25) not null unique,
	password varchar(25) not null
)
go

create table readers
(
	people_uuid char(32) not null primary key references people,
	address varchar(50) not null,
	telephone varchar(11) unique,
	email varchar(50) not null unique
)
go

create table employees
(
	people_uuid char(32) not null primary key references people,
	type varchar(15) not null,
	status varchar(20) not null -- Voltar depois aqui, que porra é status?
)
go

create table books
(
	uuid char(32) not null primary key,
	employee_uuid char(32) not null references employees,
	name varchar(50) not null,
	authors varchar(50) not null, -- Deve ser um Array
	cover image not null,
	pages varchar(4) not null,
	publishing_company varchar(50) not null,
	quantity int not null,
	isbn varchar(20) not null unique,
	genre varchar(20) not null,
	parental_rating varchar(2),
	price money not null
)
go

create table carts
(
	uuid char(32) not null primary key,
	reader_uuid char(32) not null references readers,
	bought_in datetime not null,
	total money not null,
	status_carts varchar(10) not null -- Adicionar constantes
)
go

create table items_cart
(
	cart_uuid char(32) not null references carts,
	book_uuid char(32) not null references books,
	quantity int not null,
	price money not null,
	primary key(cart_uuid, book_uuid)
)
go

