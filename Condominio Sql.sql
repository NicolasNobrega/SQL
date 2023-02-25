drop database Condominio;
create schema if not exists `Condominio` default character set utf8;
use Condominio;

create table if not exists Condominio.apartamento(
	num_apartamento integer not null auto_increment,
    bloco_ap varchar (1) not null,
    primary key (num_apartamento)
) engine=INNODB;

insert into apartamento values (null, 'A');
insert into apartamento values (null, 'B');
insert into apartamento values (null, 'C');

create table if not exists Condominio.moradores (
	cpf varchar(11) unique null,
    nome varchar(46)null,
    apartamento_id integer not null auto_increment,
    bloco varchar(1) not null,
    primary key (cpf),
    foreign key (apartamento_id) references apartamento(num_apartamento)
)engine=innodb;

insert into moradores values('11111111111','João Pimentel',null, 'A');
insert into moradores values('22222222222','José Pimentel', null,'A');
insert into moradores values('33333333333','Capitu oliveira', null,'A');
insert into moradores values('44444444444','Natasha Carneiro', null,'A');
insert into moradores values('55555555555','Cláudio Lucena', null,'B');
insert into moradores values('66666666666','Pedro Ferreira', null,'B');
insert into moradores values('77777777777','Wesbster Santiago', null,'B');
insert into moradores values('88888888888','Kelly Silva', null,'C');
insert into moradores values('99999999999','Karem Santana', null,'C');
insert into moradores values('00000000000','Josefina', null,'C');

select * from moradores;
