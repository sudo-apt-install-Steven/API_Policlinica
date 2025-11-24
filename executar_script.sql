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
('Cardiologia'),
('Dermatologia'),
('Pediatria'),
('Ortopedia'),
('Neurologia'),
('Oftalmologia');

INSERT INTO medicos (nome, telefone, email, especialidade) VALUES
('Roberto Silva Santos', '(11) 98765-4321', 'roberto.santos@clinicamedica.com.br', 1),
('Juliana Costa Oliveira', '(11) 97654-3210', 'juliana.oliveira@clinicamedica.com.br', 1),
('Fernando Alves Lima', '(11) 96543-2109', 'fernando.lima@clinicamedica.com.br', 1),
('Patricia Mendes Rocha', '(11) 95432-1098', 'patricia.rocha@clinicamedica.com.br', 2),
('Marcos Paulo Ferreira', '(11) 94321-0987', 'marcos.ferreira@clinicamedica.com.br', 2),
('Camila Rodrigues Souza', '(11) 93210-9876', 'camila.souza@clinicamedica.com.br', 2),
('Ricardo Henrique Dias', '(11) 92109-8765', 'ricardo.dias@clinicamedica.com.br', 3),
('Beatriz Martins Costa', '(11) 91098-7654', 'beatriz.costa@clinicamedica.com.br', 3),
('Lucas Gabriel Pereira', '(11) 90987-6543', 'lucas.pereira@clinicamedica.com.br', 3),
('Amanda Cristina Silva', '(11) 89876-5432', 'amanda.silva@clinicamedica.com.br', 3),
('Gustavo Barbosa Almeida', '(11) 88765-4321', 'gustavo.almeida@clinicamedica.com.br', 4),
('Larissa Fernandes Gomes', '(11) 87654-3210', 'larissa.gomes@clinicamedica.com.br', 4),
('Rafael Santos Cardoso', '(11) 86543-2109', 'rafael.cardoso@clinicamedica.com.br', 4),
('Vanessa Lima Ribeiro', '(11) 85432-1098', 'vanessa.ribeiro@clinicamedica.com.br', 5),
('Diego Costa Andrade', '(11) 84321-0987', 'diego.andrade@clinicamedica.com.br', 5),
('Isabela Souza Martins', '(11) 83210-9876', 'isabela.martins@clinicamedica.com.br', 5),
('Thiago Oliveira Nunes', '(11) 82109-8765', 'thiago.nunes@clinicamedica.com.br', 6),
('Natalia Pereira Castro', '(11) 81098-7654', 'natalia.castro@clinicamedica.com.br', 6),
('Bruno Alves Moreira', '(11) 80987-6543', 'bruno.moreira@clinicamedica.com.br', 6),
('Carolina Dias Freitas', '(11) 79876-5432', 'carolina.freitas@clinicamedica.com.br', 6);

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
