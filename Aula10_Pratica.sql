USE DB_03361B_RBONANCA2_AULA06;

CREATE TABLE Aula10_Grupo_Contato (
	id_grupo INT PRIMARY KEY AUTO_INCREMENT,	
	grupo VARCHAR (20) NOT NULL
);

INSERT INTO Aula10_Grupo_Contato (grupo) VALUES
	("Família"),
	("Trabalho"), 
	('Amigos'),
	('Outros');

CREATE TABLE Aula10_Contatos (
	id_contato INT PRIMARY KEY AUTO_INCREMENT,	
	nome VARCHAR (50) NOT NULL, 
	sobrenome VARCHAR(50),
	id_grupo INT,
	telefone VARCHAR (14), 
	email VARCHAR (100),
	CONSTRAINT fk_contato_grupo
	FOREIGN KEY (id_grupo) REFERENCES Aula10_Grupo_Contato (id_grupo)
);

INSERT INTO Aula10_Contatos (nome, sobrenome, id_grupo, telefone, email) VALUES
	('José', 'dos Santos', 1, '19 99999-9999', 'santos@email.com'),
	('João', 'Oliveira', 2, '19 95252-5555', 'oliveira@email.com'),
	('Maria', 'Graças', 2, '19 94444-7777', 'gracas@email.com'),
	('Mariana', 'dos Santos', 3, '19 7777-3333', 'mari@email.com');

CREATE TABLE Aula10_Telefones (
	id_telefone INT PRIMARY KEY AUTO_INCREMENT,
	id_contato INT NOT NULL,
	categoria VARCHAR (20) NOT NULL,
	telefone VARCHAR (14) NOT NULL DEFAULT 'CELULAR',
	CONSTRAINT fk_contato_telefone
	FOREIGN KEY (id_contato) REFERENCES Aula10_Contatos (id_contato)
);

INSERT INTO Aula10_Telefones ( id_contato, categoria, telefone) VALUES
	(1, 'Celular', '19 98888-8888'), (1, 'Casa', '19 3232-3232'), (1, 'Empresa', '19 3131-4444'),
	(2, 'Celular', '19 97777-8888'), (2, 'Empresa', '19 3124-0000'),
	(3, 'Celular', '19 95454-5454'), (3, 'Empresa', '19 3124-1111');

SELECT * FROM Aula10_Grupo_Contato;
SELECT * FROM Aula10_Contatos;
SELECT * FROM Aula10_Telefones;

SELECT nome, id_grupo,  email
FROM Aula10_Contatos;


