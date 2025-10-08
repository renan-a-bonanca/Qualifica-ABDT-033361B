-- "CRIE" "BANCO DE DADOS" [com o nome] DB_03361B_PROFURIEL_AULA06;
CREATE DATABASE DB_03361B_RBONANCA2_AULA06;

USE DB_03361B_RBONANCA2_AULA06;

-- "CRIE" "TABELA" [com o nome] PRODUTO [e atributos] (...);
CREATE TABLE Papelaria_Produto (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(250) NOT NULL,
    quantidade INT(10),
    unidade VARCHAR(10)
);

INSERT INTO Papelaria_Produto (item, quantidade, unidade) VALUES
	("Régua", 11, "unidade" ),
	("Lapis", 2, "unidade" ),
    ("Pasta", 22, "pacote" ),
    ("Tinta", 11, "litro" ),
    ("Apontador", 20, "unidade" );

SELECT *
FROM Papelaria_Produto
ORDER BY quantidade ASC
LIMIT 11;

-- "CRIE" "TABELA" [com o nome] FORNECEDOR [e atributos] (...);
CREATE TABLE Papelaria_Fornecedor (
	id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(250) NOT NULL,
    contato VARCHAR(50),
    estado VARCHAR(2)
);

INSERT INTO Papelaria_Fornecedor (empresa, contato, estado) VALUES
	("AAAAA", "email1@", "SP" ),
	("CCCCC", "email2@", "PA" ),
    ("FFFFFFF", "TELEFONE", "RJ" ),
    ("KKKKKKKK", "email7@", "SP" ),
    ("DEDEDE", "TELEFONE2", "MA" );

SELECT *
FROM Papelaria_Fornecedor
ORDER BY estado ASC
LIMIT 3;

-- "CRIE" "TABELA" [com o nome] VENDAS [e atributos] (...);
CREATE TABLE Papelaria_Vendas (
	id_venda INT PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR(250) NOT NULL,
    produto VARCHAR(50),
    data_venda DATE
);

INSERT INTO Papelaria_Vendas (cliente, produto, data_venda) VALUES
	("Paulo", "caneta", "2024/11/24" ),
	("Antonio", "papel A4", "2024/12/24" ),
    ("Renata", "borracha", "2025/08/24" ),
    ("Larissa", "borracha", "2025/09/24" ),
    ("Juliana", "elástico", "2025/09/24" );

SELECT *
FROM Papelaria_Vendas
ORDER BY cliente ASC
LIMIT 5;
