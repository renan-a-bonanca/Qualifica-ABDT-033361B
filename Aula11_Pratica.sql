-- CREATE DATABASE DB_03361B_RBONANCA_DEVMEDIA;
USE DB_03361B_RBONANCA2_AULA06;

CREATE TABLE Aula11_Aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    sobrenome VARCHAR (100) NOT NULL,
    email VARCHAR (150) UNIQUE, -- Não pode repetir email
    data_nasc DATE,
    ativo BOOLEAN DEFAULT TRUE    
);

ALTER TABLE Aula11_Aluno
CHANGE sobrenome sobrenome VARCHAR(100) NOT NULL;

CREATE TABLE Aula11_Curso (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR (200) NOT NULL,
    descricao TEXT, -- tipo textual como VARCHAR, porem sem limitação
    carga_horaria INT, -- Medida em horas/aula,
    preco DECIMAL (10,2)
);

SHOW TABLES; -- mostra todas as tabelas do BD
DESCRIBE Aula11_Aluno;

INSERT INTO Aula11_Aluno (nome, sobrenome, email, data_nasc) VALUES -- colocar ativo é OPCIONAL
	("Zé", "das Couves", "ze@gmail.com", "2025-10-13"),
    ("Maria", "dos Paes", "maria@gmail.com", "2025-10-11"),
    ("João", "Pé de Feijão", "joao@gmail.com", "2025-10-10"),
    ("Horácio", "dos Amigos", "horacio@gmail.com", "2025-10-09");
    
INSERT INTO Aula11_Aluno (nome, sobrenome, email, data_nasc, ativo) VALUES
    ("Zé", "das Neves", "neves@gmail.com", "2025-10-12", FALSE);
    
INSERT INTO Aula11_Curso (titulo, descricao, carga_horaria, preco) VALUES
	("Introdução ao SQL", "Curso Básico de SQL", 40, 299.99),
    ("Desenvolvimento Web em Python", "Usando Flash para criar Beckend", 80, 599.90),
	("Banco de Dads Avançado", "Curso avançado de SQL e Banco de Dados", 60, 450.00);
    
SELECT * FROM Aula11_Aluno;
SELECT * FROM Aula11_Curso;

UPDATE Aula11_Aluno
SET
	sobrenome = "das Neves"
WHERE id = 4;

UPDATE Aula11_Aluno
SET
	nome = "José",
    email = "ze_neves@email.com"
WHERE id = 6;

START TRANSACTION; -- No MySQL pode começar usando "BEGIN"

UPDATE Aula11_Curso
SET descricao = "Curso de desenvolvimento Web usando Python e Django"
WHERE id = 2;

SELECT * FROM Aula11_Curso;

-- ROLLBACK;
COMMIT;

DELETE FROM Aula11_Aluno
WHERE id = 6;

SELECT * FROM Aula11_Aluno;

-- TRUNCATE TABLE Aula_Aluno11;
    
