use master
Create Database DW_Empresa
use DW_Empresa


CREATE TABLE Empregado
(
 cod_Emp INT IDENTITY(1,1) PRIMARY KEY,
 RG_Empregado INT,
 Nome_Empregado VARCHAR(80),
 Numero_Projeto VARCHAR(4)
)
INSERT INTO Empregado (RG_Empregado, Nome_Empregado, Numero_Projeto)
 SELECT em.RG_Empregado, Nome_Empregado, Numero_Projeto
 FROM TestaTrigger.dbo.TB_Empregado em, TestaTrigger.dbo.TB_Empregado_Projeto ep 
 WHERE ep.RG_Empregado = em.RG_Empregado


CREATE TABLE Projeto
(
 cod_Proj INT IDENTITY(1,1) PRIMARY KEY,
 Numero_Projeto INT,
 Nome_Projeto VARCHAR(80),
 RG_Empregado VARCHAR(8),
 Numero_Depto INT)
INSERT INTO Projeto(Numero_Projeto, Nome_Projeto, RG_Empregado, Numero_Depto)
 SELECT pr.Numero_Projeto, Nome_Projeto, RG_Empregado, Numero_Depto
 FROM TestaTrigger.dbo.TB_Projeto pr, TestaTrigger.dbo.TB_Empregado_Projeto ep, TestaTrigger.dbo.TB_Departamento_Projeto dp
 WHERE pr.Numero_Projeto = ep.Numero_Projeto AND pr.Numero_Projeto = dp.Numero_Projeto


CREATE TABLE Departamento
(
 cod_Dep INT IDENTITY(1,1) PRIMARY KEY,
 Numero_Departamento INT,
 RG_Gerente VARCHAR(8)
) 
INSERT INTO Departamento(Numero_Departamento, RG_Gerente)
 SELECT Numero_Departamento, RG_Gerente
 FROM TestaTrigger.dbo.TB_Departamento de, TestaTrigger.dbo.TB_Departamento_Projeto dp 
 WHERE de.Numero_Departamento = dp.Numero_Depto


CREATE TABLE fato_Status
(
  codFato INT IDENTITY(1,1) PRIMARY KEY,

  codEmp int,
  codPRoj int,
  codDep int,
  isValid int
  
  foreign key (codEmp) references Empregado(Cod_Emp),
  foreign key (codProj) references Projeto(cod_Proj),
  foreign key (codDep) references Departamento(cod_Dep),
  
)
INSERT INTO fato_Status(codEmp, codPRoj, codDep, isValid)
 SELECT em.cod_Emp, pr.cod_Proj, de.cod_Dep, 1
 FROM Empregado em, Projeto pr, Departamento de
WHERE de.Numero_Departamento = pr.Numero_Depto AND pr.Numero_Projeto = em.Numero_Projeto AND em.RG_Empregado = pr.RG_Empregado

--truncate table fato_Status

 select * from Empregado
 select * from Projeto
 select * from Departamento
 select * from fato_Status