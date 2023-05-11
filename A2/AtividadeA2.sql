CREATE DATABASE CLINICA_MEDICA_6319041
USE CLINICA_MEDICA_6319041;
GO

CREATE TABLE Medico(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	CRM VARCHAR(12) NOT NULL UNIQUE,
	Telefone VARCHAR(11) NOT NULL,
	Data_Admissao DATE NOT NULL
)

--INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dr. João Silva', '123456', '999999999', '2022-01-01');
--INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dra. Maria Santos', '654321', '888888888', '2021-03-15');
--INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dr. Carlos Oliveira', '987654', '777777777', '2020-05-20');
--INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dra. Ana Rodrigues', '321654', '666666666', '2023-02-10');
--INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dr. Pedro Almeida', '159753', '555555555', '2021-07-05');
--INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dra. Laura Ferreira', '753951', '444444444', '2022-09-18');
--INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dr. Eduardo Santos', '246813', '333333333', '2020-11-30');
--INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dra. Beatriz Lima', '864209', '222222222', '2023-04-22');
--INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dr. Gabriel Costa', '798046', '111111111', '2021-08-12');
--INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dra. Sofia Sousa', '302581', '000000000', '2020-02-28');


CREATE TABLE Especialidade(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	NomeEspecialidade VARCHAR(50) NOT NULL
)

--INSERT INTO Especialidade (NomeEspecialidade) VALUES ('Cardiologia');
--INSERT INTO Especialidade (NomeEspecialidade) VALUES ('Dermatologia');
--INSERT INTO Especialidade (NomeEspecialidade) VALUES ('Ginecologia');
--INSERT INTO Especialidade (NomeEspecialidade) VALUES ('Ortopedia');
--INSERT INTO Especialidade (NomeEspecialidade) VALUES ('Pediatria');

CREATE TABLE MedicoEspecialidade(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	IdMedico INT FOREIGN KEY REFERENCES Medico(Id),
	IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(Id)
)

---- Dr. João Silva é cardiologista
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (1, 1);

---- Dra. Maria Santos é dermatologista
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (2, 2);

---- Dr. Carlos Oliveira é ginecologista e ortopedista
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (3, 3);
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (3, 4);

---- Dra. Ana Rodrigues é pediatra
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (4, 5);

---- Dr. Pedro Almeida é cardiologista e dermatologista
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (5, 1);
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (5, 2);

---- Dr. Eduardo Santos é ortopedista
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (7, 4);

---- Dra. Beatriz Lima é pediatra e ginecologista
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (8, 3);
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (8, 4);

---- Dr. Gabriel Costa é dermatologista e cardiologista
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (9, 2);
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (9, 1);

---- Dra. Sofia Sousa é ortopedista e pediatra
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (10, 4);
--INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (10, 5);

CREATE TABLE TipoSanguineo(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Tipo varchar(2) NOT NULL,
	Rh varchar(1) NOT NULL,

	CONSTRAINT CHECK_TIPO CHECK(Tipo IN('A','B','AB','O')),
	CONSTRAINT CHECK_RH CHECK(Rh IN('+','-'))
)
--INSERT INTO TipoSanguineo values('A','+'),('A','-'),('B','+'),('B','-'),('AB','+'),('AB','-'),('O','+'),('O','-')

CREATE TABLE Paciente(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Endereco VARCHAR(255) NOT NULL,
	Telefone VARCHAR(11) NOT NULL,
	IdTipoSanguineo INT FOREIGN KEY REFERENCES TipoSanguineo(Id)
)

---- Paciente 1
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Maria Silva', 'Rua A, 123', '99999999', 1);

---- Paciente 2
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('João Santos', 'Rua B, 456', '88888888', 2);

---- Paciente 3
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Ana Souza', 'Rua C, 789', '77777777', 3);

---- Paciente 4
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Pedro Rocha', 'Rua D, 101', '66666666', 4);

---- Paciente 5
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Lúcia Santos', 'Rua E, 111', '55555555', 5);

---- Paciente 6
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Carlos Nunes', 'Rua F, 222', '44444444', 6);

---- Paciente 7
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Paula Lima', 'Rua G, 333', '33333333', 7);

---- Paciente 8
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Lucas Almeida', 'Rua H, 444', '22222222', 8);

---- Paciente 9
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Marcela Silva', 'Rua I, 555', '11111111', 1);

---- Paciente 10
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Ricardo Castro', 'Rua J, 666', '99999999', 2);

---- Paciente 11
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Beatriz Lima', 'Rua K, 777', '88888888', 3);

---- Paciente 12
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Felipe Fernandes', 'Rua L, 888', '77777777', 4);

---- Paciente 13
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Juliana Martins', 'Rua M, 999', '66666666', 5);

---- Paciente 14
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Antônio Alves', 'Rua N, 1010', '55555555', 6);

---- Paciente 15
--INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
--VALUES ('Fernanda Oliveira', 'Rua O, 1111', '44444444', 7);


CREATE TABLE Consulta(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	IdPaciente INT FOREIGN KEY REFERENCES Paciente(Id),
	IdMedicoEspecialidade INT FOREIGN KEY REFERENCES MedicoEspecialidade(Id),
	IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(Id),
	DataConsulta DATETIME NOT NULL
)

--INSERT INTO Consulta (IdPaciente, IdMedicoEspecialidade, IdEspecialidade, DataConsulta)
--VALUES (1, 1, 1, '15-05-2023 14:00');

--INSERT INTO Consulta (IdPaciente, IdMedicoEspecialidade, IdEspecialidade, DataConsulta)
--VALUES (2, 2, 2, '18-05-2023 11:30');

--INSERT INTO Consulta (IdPaciente, IdMedicoEspecialidade, IdEspecialidade, DataConsulta)
--VALUES (3, 3, 2, '20-05-2023 09:00');

--INSERT INTO Consulta (IdPaciente, IdMedicoEspecialidade, IdEspecialidade, DataConsulta)
--VALUES (4, 4, 3, '22-05-2023 15:30');

--INSERT INTO Consulta (IdPaciente, IdMedicoEspecialidade, IdEspecialidade, DataConsulta)
--VALUES (5, 5, 3, '23-05-2023 10:00');


CREATE TABLE BancoSangue(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Quantidade INT NOT NULL,
	IdTipoSanguineo INT FOREIGN KEY REFERENCES TipoSanguineo(Id)
)

CREATE TRIGGER atualiza_banco_sangue_InsertPaciente
ON Paciente
AFTER INSERT
AS
BEGIN
	UPDATE BancoSangue
	SET Quantidade = Quantidade + 1
	FROM inserted i
	WHERE BancoSangue.IdTipoSanguineo = i.IdTipoSanguineo;
END;

