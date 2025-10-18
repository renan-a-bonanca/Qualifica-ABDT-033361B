USE DB_03361B_RBONANCA2_AULA06;

SHOW TABLES;

DESCRIBE A15_Produto;
DESCRIBE A15_Fornecedor;


-- EXERC1 - Consulta nome e preço do produto + nome, CNPJ e tel do fornec
SELECT p.nome AS "PRODUTO", 
	p.preco_unitario AS "PREÇO", 
	f.nome AS "FORNECEDOR", 
    f.cnpj AS "CNPJ", 
    f.telefone AS "TELEFONE"
FROM A15_Produto AS p
INNER JOIN A15_Fornecedor AS f
ON p.id_fornecedor = f.id;

-- EXERC2 - ConsultaNome e Telefone do cliente + n de compras por cliente
SELECT c.nome, c.telefone, COUNT(v.id)
from A15_Cliente AS c
INNER JOIN A15_Venda AS v
ON  v.id_cliente = c.id
GROUP BY c.id;

-- EXER 3
DESCRIBE A15_Produto_Vendido;

SELECT v.id, v.data_venda, c.nome, c.telefone,
round(SUM(pv.quantidade*p.preco_unitario*(1-v.desconto)),2) AS TOTAL
FROM A15_Venda as v
JOIN A15_Cliente as c ON v.id_cliente =c.id
JOIN A15_Produto_Vendido AS pv ON pv.id_venda = v.id
JOIN A15_Produto AS p ON pv.id_produto = p.id
GROUP BY v.id;


