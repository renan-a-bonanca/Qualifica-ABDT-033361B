USE DB_03361B_RBONANCA2_AULA06;

CREATE TABLE Aula14_Aluno (
	matricula_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    email VARCHAR (150),
    telefone VARCHAR (15)
) AUTO_INCREMENT 100001;

INSERT INTO Aula14_Aluno (nome, email, telefone) VALUES
	("Zé", "ze@gmail.com", "(19) 2222-3333"),
    ("Maria", "maria@gmail.com", "(19) 2222-7869"),
    ("João", "joao@gmail.com", "(19) 2222-4545"),
    ("Horácio", "horacio@gmail.com", "(19) 2222-1234");
    
CREATE TABLE Aula14_Professor (
	matricula_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    email VARCHAR (150),
    titulacao VARCHAR (30)
) AUTO_INCREMENT 200001;

INSERT INTO Aula14_Professor (nome, email, titulacao) VALUES
	("José", "jose@gmail.com", "Mestrado"),
    ("Antonia", "antonia@gmail.com", "Doutorado"),
    ("Marcos", "marcos@gmail.com", "Especialização"),
    ("Gabriela", "gabi@gmail.com", "Graduação");
    
CREATE TABLE Aula14_Disciplina (
	id_disc INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT NOT NULL,
    nome VARCHAR (100) NOT NULL,
    carga_horaria DECIMAL (10, 2),
	CONSTRAINT fk_profe_disciplina
    FOREIGN KEY (id_professor) REFERENCES Aula14_Professor(matricula_professor)
);

INSERT INTO Aula14_Disciplina (id_professor, nome, carga_horaria) VALUES
	(200001, "Computação", 100.00),
    (200002, "Matemática", 120.50),
    (200003, "Banco de Dados", 200.60),
    (200004, "TCC", 50.00);
    
SELECT * FROM Aula14_Aluno;
SELECT * FROM Aula14_Professor;
SELECT * FROM Aula14_Disciplina;

CREATE TABLE Aula14_Matricula (
	id_mat INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_disciplina INT NOT NULL,
    CONSTRAINT fk_mat_aluno
    FOREIGN KEY (id_aluno) REFERENCES Aula14_Aluno(matricula_aluno),
    CONSTRAINT fk_mat_disciplina
    FOREIGN KEY (id_disciplina) REFERENCES Aula14_Disciplina(id_disc)
);

INSERT INTO Aula14_Matricula (id_aluno, id_disciplina) VALUES
	(100001, 1), (100002, 1), (100003, 1),
    (100004, 2),  (100002, 2), (100003, 2),
    (100001, 3),  (100003, 3),
    (100003, 4);
    
SELECT * FROM Aula14_Matricula ORDER BY id_aluno;

-- Mostrar os Professores de cada Disciplia
SELECT d.nome AS "DISCIPLINA", p.nome AS "PROFESSOR"
FROM Aula14_Disciplina AS d
INNER JOIN Aula14_Professor AS p
ON d.id_professor = p.matricula_professor;
 
-- Mostrar todo os alunos matriculados na disciplina de computação
SELECT a.nome  AS "MAT Aluno", d.nome AS "Disciplina"
FROM Aula14_Matricula AS m
INNER JOIN Aula14_Disciplina AS d
INNER JOIN Aula14_Aluno AS a
WHERE d.nome = "Computação";



