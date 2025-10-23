USE DB_03361B_RBONANCA2_AULA06;

-- ATIVIDADE 1
SELECT d.nome_departamento, count(f.id_departamento) AS "N Funcionários"
FROM A18_Departamento d
LEFT JOIN A18_Funcionario f ON d.id = f.id_departamento
GROUP BY d.nome_departamento
ORDER BY d.nome_departamento;

SELECT  d.nome_departamento, CONCAT(f.nome, " ", f.sobrenome) AS Funcionário
FROM A18_Departamento d
LEFT JOIN A18_Funcionario f ON d.id = f.id_departamento
ORDER BY d.nome_departamento;

-- ATIVIDADE 2
SELECT CONCAT (f.nome, " ", f.sobrenome) AS Funcionário, CONCAT('R$ ', FORMAT((c.salario), 2, 'pt_BR')) AS Salário, nc.nivel
FROM A18_Funcionario f
JOIN A18_Cargo c ON f.id_cargo = c.id
JOIN A18_Nivel_Cargo nc ON c.salario BETWEEN nc.sal_min AND nc.sal_max
ORDER BY Funcionário;

-- ATIVIDADE 3
SELECT CONCAT (f.nome, " ", f.sobrenome) AS Funcionário, nc.nivel, d.nome_departamento
FROM A18_Funcionario f
JOIN A18_Departamento d ON f.id_departamento = d.id
JOIN A18_Cargo c ON f.id_cargo = c.id
JOIN A18_Nivel_Cargo nc ON c.salario BETWEEN nc.sal_min AND nc.sal_max
WHERE d.nome_departamento = "Financeiro" AND nc.nivel = "Pleno"
ORDER BY Funcionário;