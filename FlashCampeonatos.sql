drop database Flash_Campeonatos;
create database Flash_Campeonatos;
use Flash_Campeonatos;

-- Criação da tabela de usuários
CREATE TABLE usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  elo ENUM('Ferro', 'Bronze', 'Prata', 'Ouro', 'Platina', 'Diamante', 'Mestre') NOT NULL,
  time_id INT
);

INSERT INTO usuarios (nome, elo, time_id) VALUES 
('Usuário 1', 'Ferro', 1),
('Usuário 2', 'Ferro', 1),
('Usuário 3', 'Ferro', 1),
('Usuário 4', 'Ferro', 1),
('Usuário 5', 'Ferro', 1),

('Usuário 6', 'Ferro', 2),
('Usuário 7', 'Ferro', 2),
('Usuário 8', 'Ferro', 2),
('Usuário 9', 'Ferro', 2),
('Usuário 10', 'Ferro', 2);

-- Criação da tabela de chaves
CREATE TABLE chaves (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL
);

-- Insere os dados de exemplo na tabela de chaves
INSERT INTO chaves (nome) VALUES 
('Ferros'),
('Bronzes'),
('Prata'),
('Ouro'),
('Platina'),
('Diamante'),
('Mestre');

-- Criação da tabela de times
CREATE TABLE times (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  chave_id INT,
  FOREIGN KEY (chave_id) REFERENCES chaves(id)
);


-- Criação da tabela de usuários em uma chave (relacionamento many-to-many)
CREATE TABLE times_chave (
  id INT PRIMARY KEY AUTO_INCREMENT,
  time_id INT,
  chave_id INT,
  FOREIGN KEY (time_id) REFERENCES times(id),
  FOREIGN KEY (chave_id) REFERENCES chaves(id)
);
INSERT INTO times_chave (time_id, chave_id) VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5,2);

select * from times_chave where chave_id = 1;


