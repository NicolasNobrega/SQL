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

INSERT INTO usuarios (nome, elo, time_id) VALUES ('Usuário 1', 'Prata', 1);

-- Criação da tabela de chaves
CREATE TABLE chaves (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL
);

-- Criação da tabela de times
CREATE TABLE times (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  chave_id INT,
  FOREIGN KEY (chave_id) REFERENCES chaves(id)
);


-- Criação da tabela de usuários em uma chave (relacionamento many-to-many)
CREATE TABLE usuarios_chave (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT,
  chave_id INT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (chave_id) REFERENCES chaves(id)
);

-- Insere os dados de exemplo na tabela de chaves
INSERT INTO chaves (nome) VALUES ('Chave 1'), ('Chave 2');

-- Insere os dados de exemplo na tabela de times, atribuindo-os a uma chave
INSERT INTO times (nome, chave_id) VALUES ('Time A', 1), ('Time B', 1), ('Time C', 2);

-- Exemplo de inserção de um usuário com elo e atribuição a um time


-- Exemplo de inserção de um usuário em uma chave
INSERT INTO usuarios_chave (usuario_id, chave_id) VALUES (1, 1);

