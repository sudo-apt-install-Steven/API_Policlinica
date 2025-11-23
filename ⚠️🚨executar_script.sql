DROP DATABASE IF EXISTS clinica;
CREATE DATABASE clinica CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE clinica;

CREATE TABLE especialidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    especialidade VARCHAR(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE medicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    especialidade INT NOT NULL,
    FOREIGN KEY (especialidade) REFERENCES especialidades(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO especialidades (especialidade) VALUES
('Anestesiologia'),
('Cardiologia'),
('Dermatologia'),
('Endocrinologia'),
('Gastroenterologia'),
('Hematologia'),
('Neurologia'),
('Oftalmologia'),
('Ortopedia'),
('Pediatria'),
('Psiquiatria'),
('Urologia');

INSERT INTO medicos (nome, telefone, email, especialidade) VALUES
('Alice Alves Nogueira', '(69) 99932-9014', 'alice.nogueira@clinicamedica.com.br', 1),
('Bruno Henrique Santos', '(69) 99921-8765', 'bruno.santos@clinicamedica.com.br', 1),
('Ana Clara Ferreira', '(69) 99904-3456', 'ana.ferreira@clinicamedica.com.br', 2),
('Carlos Eduardo Lima', '(69) 99915-7890', 'carlos.lima@clinicamedica.com.br', 2),
('Fernanda Rodrigues Costa', '(69) 99928-4321', 'fernanda.costa@clinicamedica.com.br', 2),
('Gabriela Martins Souza', '(69) 99933-6543', 'gabriela.souza@clinicamedica.com.br', 3),
('Helena Cristina Almeida', '(69) 99941-2109', 'helena.almeida@clinicamedica.com.br', 3),
('Igor Pereira Dias', '(69) 99952-8765', 'igor.dias@clinicamedica.com.br', 4),
('Juliana Mendes Barbosa', '(69) 99963-4321', 'juliana.barbosa@clinicamedica.com.br', 4),
('Leonardo Silva Oliveira', '(69) 99974-9876', 'leonardo.oliveira@clinicamedica.com.br', 5),
('Mariana Silva Oliveira', '(69) 99902-5678', 'mariana.oliveira@clinicamedica.com.br', 6),
('Nicolas Ferreira Santos', '(69) 99985-6543', 'nicolas.santos@clinicamedica.com.br', 6),
('Olivia Costa Ribeiro', '(69) 99996-3210', 'olivia.ribeiro@clinicamedica.com.br', 7),
('Paulo Roberto Andrade', '(69) 99907-8765', 'paulo.andrade@clinicamedica.com.br', 7),
('Rafaela Gomes Pereira', '(69) 99918-4321', 'rafaela.pereira@clinicamedica.com.br', 8),
('Rodrigo Alves Martins', '(69) 99929-9876', 'rodrigo.martins@clinicamedica.com.br', 9),
('Sofia Beatriz Cardoso', '(69) 99930-6543', 'sofia.cardoso@clinicamedica.com.br', 9),
('Daniel Batista Rezende', '(69) 99917-5671', 'daniel.rezende@clinicamedica.com.br', 10),
('Bianca Costa Farias', '(69) 99945-1236', 'bianca.farias@clinicamedica.com.br', 10),
('Thiago Henrique Souza', '(69) 99942-3210', 'thiago.souza@clinicamedica.com.br', 10),
('Valentina Oliveira Lima', '(69) 99953-8765', 'valentina.lima@clinicamedica.com.br', 11),
('William Castro Rocha', '(69) 99964-4321', 'william.rocha@clinicamedica.com.br', 11),
('Yasmin Ferreira Alves', '(69) 99975-9876', 'yasmin.alves@clinicamedica.com.br', 12),
('Zeca Rodrigues Barbosa', '(69) 99986-6543', 'zeca.barbosa@clinicamedica.com.br', 12);

SELECT 'Especialidades cadastradas:' AS Info;
SELECT * FROM especialidades;

SELECT 'Médicos cadastrados:' AS Info;
SELECT 
    m.id,
    m.nome,
    m.telefone,
    m.email,
    e.especialidade
FROM medicos m
INNER JOIN especialidades e ON m.especialidade = e.id
ORDER BY m.nome;

SELECT 'Total de médicos por especialidade:' AS Info;
SELECT 
    e.especialidade,
    COUNT(m.id) AS total_medicos
FROM especialidades e
LEFT JOIN medicos m ON e.id = m.especialidade
GROUP BY e.id, e.especialidade
ORDER BY e.especialidade;
