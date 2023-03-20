-- Criar uma tabela chamada 'clientes'
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255),
  email VARCHAR(255),
  telefone VARCHAR(20),
  data_nascimento DATE,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserir alguns dados na tabela 'clientes'
INSERT INTO clientes (nome, email, telefone, data_nascimento)
VALUES 
  ('João da Silva', 'joao.silva@email.com', '(11) 9999-8888', '1980-05-20'),
  ('Maria Santos', 'maria.santos@email.com', '(21) 9999-7777', '1990-10-15'),
  ('José Oliveira', 'jose.oliveira@email.com', '(31) 9999-6666', '1975-01-01');

-- Exibir todos os dados da tabela 'clientes'
SELECT * FROM clientes;

-- Exibir apenas os nomes e emails dos clientes
SELECT nome, email FROM clientes;

-- Exibir apenas clientes com idade acima de 30 anos
SELECT nome, email, telefone, data_nascimento FROM clientes WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 30;

-- Atualizar o telefone do cliente com ID 1
UPDATE clientes SET telefone = '(11) 8888-7777' WHERE id = 1;

-- Excluir o cliente com ID 3
DELETE FROM clientes WHERE id = 3;
