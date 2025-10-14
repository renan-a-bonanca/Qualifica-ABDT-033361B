USE DB_03361B_RBONANCA2_AULA06;

-- PADARIA
CREATE TABLE Aula12_Produtos_Padaria (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR (50) NOT NULL,
    preco DECIMAL (10,2) NOT NULL,
    quantidade INT NOT NULL,
    unidade VARCHAR (50)
) AUTO_INCREMENT 1001;

INSERT INTO Aula12_Produtos_Padaria (item, preco, quantidade, unidade) VALUES
	('Pão', 6.99, 20, 'Quilo'),
    ('Mortadela', 29.90, 9, 'Quilo'),
    ('Suco de Laranja', 15.00, 12, 'Litro'),
    ('Sonho de Creme', 6.00, 8, 'Unidade'),
    ('Pates de Carne', 14.70, 4, 'Unidade');
    
SELECT * FROM  Aula12_Produtos_Padaria;

UPDATE Aula12_Produtos_Padaria
SET item = 'Pastel de Queijo'
WHERE id_produto = 1004;

UPDATE  Aula12_Produtos_Padaria
SET preco = '13.50'
WHERE id_produto = 1003;

DELETE FROM Aula12_Produtos_Padaria
WHERE id_produto = 1002;

SELECT * FROM  Aula12_Produtos_Padaria;

