drop database RH;

create schema if not exists `RH`;
use RH;

create table if not exists empregados(
	Empregados_ID Int not null auto_increment primary key,
	Primeiro_Nome varchar(20) not null,
    Ultimo_Nome varchar(25) not null,
    Email varchar(25) not null,
    Telefone varchar(25) not null,
    Cargo_ID int not null,
    Salario double not null,
    Depto_ID int not null,
    Gerente_ID int not null,
    foreign key (Depto_ID) references departamentos(Depto_ID),
    foreign key (Cargo_ID) references cargos(Cargo_ID)
);

insert into empregados (Primeiro_Nome, Ultimo_Nome,Email,Telefone,Cargo_ID,Salario,Depto_ID,Gerente_ID) values
('Nicolas','Nobrega','nicolas1nobrega@gmail.com','61 123456789', 1, 1200, 1, 1),
('Jorge','Mendes','JorgeMendes@gmail.com','61 123456710', 2, 2600, 1, 1),
('Rafael','Aguiar','RafaelAguiar@gmail.com','61 123456711', 2, 2600, 2, 2),
('Marcelo','Marques','MarceloMarques@gmail.com','61 123456712', 4, 6600, 3, 3),
('Davi','Miguel','DaviMiguel@gmail.com','61 123456719', 4, 7000, 3, 3);

create table if not exists departamentos(
	Depto_ID int not null auto_increment primary key,
    Nome_Depto varchar (45) not null,
    Gerente_ID int not null,
    foreign key (Gerente_ID) references empregados(Gerente_ID)
);

insert into departamentos (Nome_Depto,Gerente_ID) values
('Nucleo de Informatica', 1),
('Central de Pessoas', 2),
('Gabinete', 3);

create table if not exists cargos (
	Cargo_ID int not null auto_increment primary key,
    Titulo varchar(45) not null,
    Salario_Min double not null,
    Salario_Max double not null
);

insert into cargos (Titulo, Salario_Min, Salario_Max) values
('Estagiario',1000,1400),
('Surpevisor',1800,2600),
('Analista',3000,4500),
('Scrum Master',5000,7000);

select * from empregados;

--1--

select Primeiro_Nome, Ultimo_Nome, Email, Salario
from empregados
where Salario > 6000;

--2--

select
	E.Primeiro_Nome,
    E.Ultimo_Nome,
    C.Titulo from empregados as E inner join cargos as C on (E.Cargo_ID = C.Cargo_ID);

--3--
    
Select
	d.Depto_ID,
    d.Nome_Depto,
    e.Gerente_ID
from departamentos d
left outer join
	empregados e on d.Gerente_ID = e.Gerente_ID;

--4--
    
select Depto_ID, Min(salario)
from empregados
group by Depto_ID;

--5--

select Gerente_ID, count(Gerente_ID)
from empregados
group by Gerente_ID;
    

