-- Exercico 1 - Padaria

USE DB_03361B_RBONANCA2_AULA06;

CREATE TABLE Aula08Ex01_Produto (
	id_produto INT PRIMARY KEY auto_increment,
    nome VARCHAR(100) not null,
    preco DECIMAL(8,2)
);

CREATE TABLE Aula08Ex01_Vendas (
	id_venda INT PRIMARY KEY auto_increment,
    id_produto INT not null,
    quantidade INT not null,
    data_venda DATE,
    -- BOA PRATICA, constraint no final da tabe
    CONSTRAINT fk_venda01_produto -- Boa prática, Nome da foreign key
    FOREIGN KEY (id_produto) REFERENCES Aula08Ex01_Produto(id_produto)
);

CREATE TABLE Aula08Ex01_Fornecedor (
	id_fornecedor INT PRIMARY KEY auto_increment,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);



INSERT INTO Aula08Ex01_Produto (nome, preco) VALUES
	("Prod A", 3.50),
    ("Prod B", 1.00),
    ("Prod C", 4.50),
    ("Prod D", 2.50);
    
INSERT INTO Aula08Ex01_Vendas (id_produto, quantidade, data_venda) VALUES
	(1, 1, "2025-10-08"),
    (1, 2, "2025-10-08"),
    (2, 1, "2025-10-07"),
    (2, 3, "2025-10-07"),
    (3, 2, "2025-10-06"),
    (4, 5, "2025-10-05");
    
INSERT INTO Aula08Ex01_Fornecedor (nome, telefone) VALUES
	("Fornec A", 11111111),
    ("Fornec B", 22222222),
    ("Fornec C", 44444444),
    ("Fornec D", 77777777);
    
SELECT * FROM Aula08Ex01_Produto;

SELECT id_produto, SUM(quantidade)
FROM Aula08Ex01_Vendas
GROUP BY id_produto;

SELECT id_produto, SUM(quantidade)
FROM Aula08Ex01_Vendas
WHERE id_produto = 3;

SELECT * 
FROM Aula08Ex01_Vendas
WHERE data_venda = "2025-10-08";
    
    

-- Exercico 2 - ESCOLA

USE DB_03361B_RBONANCA2_AULA06;

CREATE TABLE Aula08Ex02_Aluno (
	id_aluno INT PRIMARY KEY auto_increment,
    nome VARCHAR(50) not null,
    sobrenome VARCHAR(50),
    curso VARCHAR(100)
);

CREATE TABLE Aula08Ex02_Professor (
	id_professor INT PRIMARY KEY auto_increment,
    nome_professor VARCHAR (100) not null,
    curso VARCHAR (100) 
);

CREATE TABLE Aula08Ex02_Comentario (
	id_comentario INT PRIMARY KEY auto_increment,
    id_aluno INT not null,
    id_professor INT not null,
    comentario TEXT,
    notaprofessor DECIMAL (3,1),
    CONSTRAINT fk_comentario_escola
    FOREIGN KEY (id_aluno) REFERENCES Aula08Ex02_Aluno(id_aluno),
    CONSTRAINT fk_comentario02_escola
    FOREIGN KEY (id_professor) REFERENCES Aula08Ex02_Professor(id_professor)   
);

INSERT INTO Aula08Ex02_Aluno (nome, sobrenome, curso) VALUES
	("Marcos", "Silva", "Informática"),
    ("Joaõ", "Souza", "Informática"),
    ("Maria", "Bento", "Eletrônica"),
    ("Renan", "Bonança", "Ecologia"),
    ("Juliana", "Bueno", "Enfermagem");
    
INSERT INTO Aula08Ex02_Professor (nome_professor, curso) VALUES
	("Antonio", "Informática"),
    ("Benedito", "Eletrônica"),
    ("Milton", "Ecologia"),
    ("Sueli", "Enfermagem");
    
INSERT INTO Aula08Ex02_Comentario (id_aluno, id_professor, comentario, notaprofessor) VALUES
	(1, 1, "Muito Bom", 9.5),
    (2, 2, "Bom", 5.5),
    (3, 1, "Bom", 6.5),
    (4, 4, "Muito Bom", 9.0),
    (5, 1, "Ruim", 2.5),
    (1, 3, "Ruim", 3.0),
    (2, 2, "Ruim", 1.0),
    (3, 2, "Bom", 5.5),
    (4, 4, "Muito Bom", 9.0),
    (5, 3, "Muito Bom", 7.5);
    
SELECT * FROM Aula08Ex02_Aluno;

SELECT * FROM Aula08Ex02_Professor;

SELECT comentario, notaprofessor, id_professor
FROM Aula08Ex02_Comentario;

SELECT comentario, notaprofessor
FROM Aula08Ex02_Comentario
WHERE notaprofessor < 6.0;

SELECT comentario, notaprofessor
FROM Aula08Ex02_Comentario
WHERE notaprofessor > 6.0;
    

-- Exercico 3 - LOCADORA

USE DB_03361B_RBONANCA2_AULA06;

CREATE TABLE Aula08Ex03_Cliente (
	id_cliente INT PRIMARY KEY auto_increment,
    nome VARCHAR(50) not null,
    sobrenome VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

INSERT INTO Aula08Ex03_Cliente (nome, sobrenome, telefone, email) VALUES
	("Marcos", "Silva", "1111-1111", "marcos@gmail"),
    ("Joaõ", "Souza", "1222-1222", "joao@gmail"),
    ("Maria", "Bento", "7777-7777", "maria@gmail"),
    ("Renan", "Bonança", "7778-8888", "renan@gmail"),
    ("Juliana", "Bueno", "1234-5678", "juliana@gmail");

CREATE TABLE Aula08Ex03_Automovel (
	id_auto INT PRIMARY KEY auto_increment,
    marca VARCHAR(50) not null,
    modelo VARCHAR(50),
    tipo VARCHAR(50)
);

INSERT INTO Aula08Ex03_Automovel (marca, modelo, tipo) VALUES
	("Fiat", "UNO", "2017"),
    ("Fiat", "Fiorino", "2020"),
    ("Jeep", "Renegate", "2021"),
    ("VW", "Polo", "2009"),
    ("Renault", "Sandero", "2021");

CREATE TABLE Aula08Ex03_DataLocacao (
	id_datalocacao INT PRIMARY KEY auto_increment,
    id_cliente INT not null,
    id_auto INT not null,
    datainiciolocacao DATE,
    datafinallocacao DATE,
    CONSTRAINT fk_cliente_locadora
    FOREIGN KEY (id_cliente) REFERENCES Aula08Ex03_Cliente(id_cliente),
    CONSTRAINT fk_auto_locacao
    FOREIGN KEY (id_auto) REFERENCES Aula08Ex03_Automovel(id_auto)   
);
    
INSERT INTO Aula08Ex03_DataLocacao (id_cliente, id_auto, datainiciolocacao, datafinallocacao) VALUES
	(1, 5, "2025-08-01", "2025-08-10"),
    (2, 4, "2025-08-03", "2025-08-17"),
    (3, 3, "2025-08-22", "2025-08-30"),
    (4, 2, "2025-09-05", "2025-09-22"),
    (5, 1, "2025-09-09", "2025-09-09");
    
SELECT * FROM Aula08Ex03_Cliente;

SELECT * FROM Aula08Ex03_Automovel;

SELECT *
FROM Aula08Ex03_DataLocacao
JOIN Aula08Ex03_Cliente ON Aula08Ex03_DataLocacao.id_cliente = Aula08Ex03_Cliente.id_cliente
JOIN Aula08Ex03_Automovel ON Aula08Ex03_DataLocacao.id_auto = Aula08Ex03_Automovel.id_auto;

