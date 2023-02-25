drop database `PCPokemon`;
create schema if not exists `PCPokemon` default character set utf8;
use `PCPokemon`;

create table treinadores (
	id int not null auto_increment primary key,
    nome varchar(50) not null
);

INSERT INTO treinadores (nome)
VALUES 
    ('Ash Ketchum'),
    ('Misty'),
    ('Brock'),
    ('Gary');

create table pokemon (
	id int not null auto_increment primary key,
    nome varchar(50) not null,
    nivel int not null,
    treinador_id int not null,
    foreign key (treinador_id) references treinadores(id)
    
	);

INSERT INTO pokemon (nome, nivel, treinador_id) VALUES 
	('Charizard', 50, 1),
	('Pikachu', 25, 1),
	('Squirtle', 20, 2),
	('Bulbasaur', 18, 2),
    ('Charmander', 15, 3),
    ('Swampert', 50, 3);

create table tipos (
	id int not null auto_increment primary key,
    nome varchar(50) not null
);

INSERT INTO tipos (nome) VALUES
 ('Fogo'), 
 ('Voador'),
 ('Eletrico'),
 ('Agua'),
 ('Planta'),
 ('Terra');

create table pokemon_tipos (
	pokemon_id int not null,
    tipo_id int not null,
    foreign key(pokemon_id) references pokemon(id),
    foreign key(tipo_id) references tipos(id),
    primary key (pokemon_id, tipo_id)
);

INSERT INTO pokemon_tipos (pokemon_id, tipo_id) VALUES 
(1, 1), (1, 2),
(2, 3),
(3, 4),
(4, 5),
(6, 4),
(6, 6);


create table treinadores_pokemon(
	treinador_id int not null,
    pokemon_id int not null,
    foreign key (treinador_id) references treinadores(id),
    foreign key (pokemon_id) references pokemon(id),
    primary key (treinador_id, pokemon_id)
	);



INSERT INTO treinadores_pokemon (treinador_id, pokemon_id) VALUES
 (1, 1),
 (2, 2),
 (2, 3),
 (3, 4),
 (3, 6);

select
t.nome as treinador,
p.nome as pokemon,
group_concat(pt.tipo_id separator ',') as tipos
from treinadores_pokemon tp
join treinadores t on tp.treinador_id = t.id
join pokemon p on tp.pokemon_id = p.id
join pokemon_tipos pt on p.id = pt.pokemon_id
join tipos t2 on pt.tipo_id = t2.id
group by t.nome, p.nome;

select
 t.nome as treinador,
 p.nome as pokemon, 
 group_concat(tp2.nome) as tipos
from treinadores t
join treinadores_pokemon tp on t.id = tp.treinador_id
join pokemon p on p.id = tp.pokemon_id
join pokemon_tipos pt on pt.pokemon_id = p.id
join tipos tp2 on tp2.id = pt.tipo_id
group by t.id, p.id;
