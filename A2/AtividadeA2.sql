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

CREATE TABLE Especialidade(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	NomeEspecialidade VARCHAR(50) NOT NULL
)

CREATE TABLE MedicoEspecialidade(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	IdMedico INT FOREIGN KEY REFERENCES Medico(Id),
	IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(Id)
)

CREATE TABLE TipoSanguineo(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Tipo varchar(2) NOT NULL,
	Rh varchar(1) NOT NULL,

	CONSTRAINT CHECK_TIPO CHECK(Tipo IN('A','B','AB','O')),
	CONSTRAINT CHECK_RH CHECK(Rh IN('+','-'))
)

CREATE TABLE Paciente(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Endereco VARCHAR(255) NOT NULL,
	Telefone VARCHAR(11) NOT NULL,
	IdTipoSanguineo INT FOREIGN KEY REFERENCES TipoSanguineo(Id)
)

CREATE TABLE Consulta(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	IdPaciente INT FOREIGN KEY REFERENCES Paciente(Id),
	IdMedicoEspecialidade INT FOREIGN KEY REFERENCES MedicoEspecialidade(Id),
	DataConsulta DATETIME NOT NULL
)

CREATE TABLE BancoSangue(
	Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Quantidade INT NOT NULL,
	IdTipoSanguineo INT FOREIGN KEY REFERENCES TipoSanguineo(Id)
)

/*-----INSERTS Medico-----*/
INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dr. João Silva', '123456', '999999999', '2022-01-01');
INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dra. Maria Santos', '654321', '888888888', '2021-03-15');
INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dr. Carlos Oliveira', '987654', '777777777', '2020-05-20');
INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dra. Ana Rodrigues', '321654', '666666666', '2023-02-10');
INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dr. Pedro Almeida', '159753', '555555555', '2021-07-05');
INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dra. Laura Ferreira', '753951', '444444444', '2022-09-18');
INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dr. Eduardo Santos', '246813', '333333333', '2020-11-30');
INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dra. Beatriz Lima', '864209', '222222222', '2023-04-22');
INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dr. Gabriel Costa', '798046', '111111111', '2021-08-12');
INSERT INTO Medico (Nome, CRM, Telefone, Data_Admissao) VALUES ('Dra. Sofia Sousa', '302581', '000000000', '2020-02-28');

/*-----INSERTS Especialidade-----*/
INSERT INTO Especialidade (NomeEspecialidade) VALUES ('Cardiologia');
INSERT INTO Especialidade (NomeEspecialidade) VALUES ('Dermatologia');
INSERT INTO Especialidade (NomeEspecialidade) VALUES ('Ginecologia');
INSERT INTO Especialidade (NomeEspecialidade) VALUES ('Ortopedia');
INSERT INTO Especialidade (NomeEspecialidade) VALUES ('Pediatria');
GO
/*-----INSERTS MedicoEspecialidade-----*/
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (1, 1);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (2, 2);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (3, 3);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (3, 4);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (4, 5);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (5, 1);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (5, 2);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (7, 4);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (8, 3);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (8, 4);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (9, 2);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (9, 1);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (10, 4);
INSERT INTO MedicoEspecialidade (IdMedico, IdEspecialidade) VALUES (10, 5);
GO
/*-----INSERTS TipoSanguineo-----*/
INSERT INTO TipoSanguineo values('A','+'),('A','-'),('B','+'),('B','-'),('AB','+'),('AB','-'),('O','+'),('O','-')
GO

/*-----INSERTS BancoSangue-----*/
INSERT INTO BancoSangue (Quantidade, IdTipoSanguineo) VALUES (0, 1);
INSERT INTO BancoSangue (Quantidade, IdTipoSanguineo) VALUES (0, 2);
INSERT INTO BancoSangue (Quantidade, IdTipoSanguineo) VALUES (0, 3);
INSERT INTO BancoSangue (Quantidade, IdTipoSanguineo) VALUES (0, 4);
INSERT INTO BancoSangue (Quantidade, IdTipoSanguineo) VALUES (0, 5);
INSERT INTO BancoSangue (Quantidade, IdTipoSanguineo) VALUES (0, 6);
INSERT INTO BancoSangue (Quantidade, IdTipoSanguineo) VALUES (0, 7);
INSERT INTO BancoSangue (Quantidade, IdTipoSanguineo) VALUES (0, 8);

/*----- TRIGGERS PACIENTE -----*/
CREATE TRIGGER tr_ins_Paciente
ON Paciente
AFTER INSERT
AS
BEGIN
        UPDATE BancoSangue
		SET Quantidade = Quantidade + 1
		WHERE IdTipoSanguineo = (SELECT IdTipoSanguineo FROM inserted)
    END

CREATE TRIGGER update_quantidade
ON Paciente
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE BancoSangue
	SET Quantidade = (SELECT COUNT(*) FROM Paciente WHERE IdTipoSanguineo = BancoSangue.IdTipoSanguineo)
	FROM inserted
	WHERE BancoSangue.IdTipoSanguineo = inserted.IdTipoSanguineo
END
GO

CREATE TRIGGER delete_paciente
ON Paciente
AFTER DELETE
AS
BEGIN
	UPDATE BancoSangue
	SET Quantidade = (SELECT COUNT(*) FROM Paciente WHERE IdTipoSanguineo = BancoSangue.IdTipoSanguineo)
	FROM deleted
	WHERE BancoSangue.IdTipoSanguineo = deleted.IdTipoSanguineo
END
GO


/*-----INSERTS Paciente-----*/
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Maria Silva', 'Rua A, 123', '99999999', 1);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('João Santos', 'Rua B, 456', '88888888', 2);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Ana Souza', 'Rua C, 789', '77777777', 3);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Pedro Rocha', 'Rua D, 101', '66666666', 4);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Lúcia Santos', 'Rua E, 111', '55555555', 5);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Carlos Nunes', 'Rua F, 222', '44444444', 6);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Paula Lima', 'Rua G, 333', '33333333', 7);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Lucas Almeida', 'Rua H, 444', '22222222', 8);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Marcela Silva', 'Rua I, 555', '11111111', 1);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Ricardo Castro', 'Rua J, 666', '99999999', 2);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Beatriz Lima', 'Rua K, 777', '88888888', 3);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Felipe Fernandes', 'Rua L, 888', '77777777', 4);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Juliana Martins', 'Rua M, 999', '66666666', 5);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Antônio Alves', 'Rua N, 1010', '55555555', 6);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Fernanda Oliveira', 'Rua O, 1111', '44444444', 7);
INSERT INTO Paciente (Nome, Endereco, Telefone, IdTipoSanguineo)
VALUES ('Murilo Rodrigues', 'Rua 3, 12345', '99999', 1);



/*-----INSERTS Consulta-----*/
INSERT INTO Consulta (IdPaciente, IdMedicoEspecialidade, DataConsulta)
VALUES (1, 1, '15-05-2023 14:00');
INSERT INTO Consulta (IdPaciente, IdMedicoEspecialidade, DataConsulta)
VALUES (2, 2, '18-05-2023 11:30');
INSERT INTO Consulta (IdPaciente, IdMedicoEspecialidade, DataConsulta)
VALUES (3, 3, '20-05-2023 09:00');
INSERT INTO Consulta (IdPaciente, IdMedicoEspecialidade, DataConsulta)
VALUES (4, 4, '22-05-2023 15:30');
INSERT INTO Consulta (IdPaciente, IdMedicoEspecialidade, DataConsulta)
VALUES (5, 5, '23-05-2023 10:00');



--Busca as consultas que ainda não foram realizadas
Select C.DataConsulta AS 'Data da Consulta', M.Nome AS 'Nome do Medico', E.NomeEspecialidade AS 'Especialidade', P.Nome AS 'Nome do Paciente', TP.Tipo + ' ' + TP.Rh AS 'Tipo Sanguineo Paciente' from Consulta C
inner join MedicoEspecialidade ME
on C.IdMedicoEspecialidade = ME.Id
inner join Medico M
on M.Id = ME.IdMedico
inner join Especialidade E
on E.Id = ME.IdEspecialidade
inner join Paciente P
on P.Id = C.IdPaciente
inner join TipoSanguineo TP
on TP.Id = P.IdTipoSanguineo
where C.DataConsulta > GETDATE()

--Busca a quantidade de pacientes com seus respectivos tipos sanguíneos
select TP.Tipo + ' ' + TP.Rh AS 'Tipo Sanguineo', BS.Quantidade 'Quantidade Pacientes' from BancoSangue BS
inner join TipoSanguineo TP
on BS.IdTipoSanguineo = TP.Id
