--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--Aluno: André Luiz Branco Belem Myszko
--RA: 2019102420

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--create database TestaTrigger
--use TestaTrigger

--create table TB_Empregado (
--  RG_Empregado  character(8) not null constraint PK_Empregado primary key, 
--  Nome_Empregado character(40), 
--  CPF_Empregado character(11),  
--  RG_Supervisor character(8), 
--  Salario_Empregado money,
--  Depto_Empregado  integer); 
---- foreign key (RG_Supervisor) references TB_Empregado);
---- drop table TB_Empregado;
---- ALTER TABLE TB_Empregado DROP CONSTRAINT RG_Supervisor;

 
--insert into TB_Empregado values ('23456789', 'Jose da Silva',		'11111111111', '23456789', '3000.00', 2);

--alter table TB_Empregado add constraint Fk_RGSupervisor foreign key (RG_Supervisor) references TB_Empregado;	-- Alterado chave estrangeira da Tabela Empregado

--insert into TB_Empregado values ('34567891', 'Marcelo Fermann',	'22222222222', '23456789', '40000.00', 1);
--insert into TB_Empregado values ('45678912', 'Diego Addam',		'33333333333', '34567891', '2000.00', 3);
--insert into TB_Empregado values ('56789123', 'Martim Morais',		'44444444444', '23456789', '2300.00', 4);
--insert into TB_Empregado values ('67891234', 'Trebien',				'55555555555', '45678912', '3500.00', 2);

--insert into TB_Empregado values ('12345678', 'tst1',				'66666666666', '67891234', '1000.00', 4);
--insert into TB_Empregado values ('12345555', 'Ze Siclano',			'77777777777', '45678912', '1600.00', 1);

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--create table TB_Departamento (
--  Numero_Departamento integer not null constraint PK_Departamento primary key, 
--  Nome_Departamento character(40), 
--  RG_Gerente character(8),
--  constraint FK_Departamento foreign key (RG_Gerente) references TB_Empregado);
-- --drop table TB_Departamento

--insert into TB_Departamento values(1, 'Hardware Potencia', '56789123');
--insert into TB_Departamento values(2, 'Hardware uC', '34567891');
--insert into TB_Departamento values(3, 'Software Potencia', '56789123');
--insert into TB_Departamento values(4, 'Software uC', '34567891');

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--create table TB_Projeto (
--  Numero_Projeto integer not null constraint PK_Projeto primary key, 
--  Nome_Projeto character(40), 
--  Cidade_Projeto character(40));
---- drop table TB_Projeto

--insert into TB_Projeto values(1701, 'Fonte 10w', 'Curitiba');
--insert into TB_Projeto values(1702, 'Syncronismo rede', 'Pinhais');
--insert into TB_Projeto values(1703, 'Systema incubadora', 'Curitiba');
--insert into TB_Projeto values(1704, 'FW syncronismo rede', 'Pinhais');
--insert into TB_Projeto values(1705, 'Sincronizador', 'Area 51');

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--create table TB_Dependente (
--  RG_Responsavel character(8), 
--  Nome_dependente character(40), 
--  Data_Nascimento date, 
--  Relacao character(40), 
--  Sexo character(1) check (Sexo in ('M','F')),
--  constraint PK_Dependente primary key (RG_Responsavel, Nome_dependente),
--  constraint FK_RGResponsavel foreign key (RG_Responsavel) references TB_Empregado);
---- drop table TB_Dependente

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--create table TB_Departamento_Projeto (
--  Numero_Depto integer, 
--  Numero_Projeto integer,
--  constraint FK_NumeroDepto foreign key (Numero_Depto) references TB_Departamento,
--  constraint FK_NumeroProjeto foreign key (Numero_Projeto) references TB_Projeto);
---- drop table TB_Departamento_Projeto;

--insert into TB_Departamento_Projeto values(1, 1701);
--insert into TB_Departamento_Projeto values(2, 1702);
--insert into TB_Departamento_Projeto values(3, 1703);
--insert into TB_Departamento_Projeto values(4, 1704);
--insert into TB_Departamento_Projeto values(1, 1705);

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--create table TB_Empregado_Projeto (
--  RG_Empregado character(8), 
--  Numero_Projeto integer, 
--  Horas integer,
--  constraint PF_EmpregadoProjeto primary key (RG_Empregado, Numero_Projeto),
--  constraint FK_RGEmpregado foreign key (RG_Empregado) references TB_Empregado,
--  foreign key (Numero_Projeto) references TB_Projeto);
---- drop table TB_Empregado_Projeto;

--insert into TB_Empregado_Projeto values('23456789', 1701, 9);
----insert into TB_Empregado_Projeto values('34567891', 1702, 6);
--insert into TB_Empregado_Projeto values('45678912', 1703, 7);
--insert into TB_Empregado_Projeto values('56789123', 1704, 8);
--insert into TB_Empregado_Projeto values('23456789', 1703, 14);

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--SELECT--
--select * from TB_Empregado;
--select * from TB_Projeto;
--select * from TB_Departamento;
--select * from TB_Departamento_Projeto;
--select * from TB_Empregado_Projeto;

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--
--MATERIAL--

--CREATE TRIGGER TG_Permite_UF
--ON Cliente
--FOR INSERT
--AS
--IF EXISTS (SELECT *
-- FROM INSERTED
-- WHERE UF_CLI IN ('PA', 'AC'))
-- BEGIN
--PRINT 'INSERÇÃO DE REGISTRO CANCELADA.'
--PRINT 'ESTADO (UF) PROIBIDO!!'
--ROLLBACK
-- END
--ELSE
--PRINT 'INSERÇÃO EXECUTADA - ESTADO PERMITIDO!'

--ALTER TABLE Nome_da_Tabela
--ENABLE/DISABLE TRIGGER Nome_da_Trigger 

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--a)    Crie uma trigger que atualize automaticamente o RG do responsável de um dependente sempre que o mesmo (RG do empregado) for atualizado na tabela empregado

--CREATE OR ALTER TRIGGER tg_updateRgResponsavel
--ON TB_Empregado 
--INSTEAD OF UPDATE
--AS
--BEGIN
--DECLARE @RG VARCHAR(8);
--DECLARE @RG_ANTIGO VARCHAR(8);

--SELECT @RG_ANTIGO = (SELECT RG_Empregado FROM DELETED);
--SELECT @RG = (SELECT RG_Empregado FROM INSERTED);

--IF UPDATE(RG_Empregado)
--BEGIN
--INSERT INTO TB_Empregado SELECT * FROM INSERTED
--UPDATE TB_Empregado SET RG_Supervisor = @RG WHERE TB_Empregado.RG_Supervisor = @RG_ANTIGO
--UPDATE TB_Dependente SET RG_Responsavel = @RG WHERE TB_Dependente.RG_Responsavel = @RG_ANTIGO
--UPDATE TB_Empregado_Projeto SET RG_Empregado = @RG WHERE TB_Empregado_Projeto.RG_Empregado = @RG_ANTIGO
--UPDATE TB_Departamento SET RG_Gerente = @RG WHERE TB_Departamento.RG_Gerente = @RG_ANTIGO
--DELETE FROM TB_Empregado WHERE RG_Empregado = @RG_ANTIGO
--END 
--END

--UPDATE TB_Empregado
--SET RG_Empregado = '99999999999'
--WHERE RG_Empregado = '77777777777'

--SELECT * FROM TB_Empregado

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--b)    Crie uma trigger que evite que sejam inseridos novos dependentes (na tabela dependentes) se a idade do dependente for maior que 18 anos e ele for do sexo masculino.

--CREATE TRIGGER tg_naoInsereDependenteMasculinoMaior
--ON TB_Dependente
--FOR INSERT
--AS
--IF EXISTS (SELECT Data_Nascimento, Sexo
-- FROM INSERTED
-- WHERE 
-- Sexo = 'M' 
-- AND
-- DATEDIFF(YEAR, Data_Nascimento, CURRENT_TIMESTAMP) > 18)
-- BEGIN
--	PRINT 'INSERÇÃO DE DEPENDENTE MASCULINO MAIOR DE 18 ANOS PROIBIDO.'
--	ROLLBACK
-- END

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--c)    Crie uma trigger que evite que um empregado seja supervisor dele mesmo. Essa trigger deve ainda verificar se o RG do supervisor é um RG válido (isto é, se o RG do supervisor é um RG cadastrado na tabela empregado)

--CREATE TRIGGER tg_evitaSupervisorEmpregadoIgual
--ON TB_Empregado
--FOR INSERT
--AS
--IF EXISTS (SELECT RG_Empregado, RG_Supervisor
-- FROM INSERTED
-- WHERE 
-- RG_Empregado = RG_Supervisor)
-- BEGIN
--	PRINT 'Empregado e Supervisor não podem ser a mesma pessoa'
--	ROLLBACK
-- END
-- IF NOT EXISTS (SELECT RG_Supervisor, RG_Empregado
-- FROM INSERTED
-- WHERE 
-- RG_Empregado = RG_Supervisor)
-- BEGIN
--	PRINT 'Supervisor deve ser um empregado com RG cadastrado'
--	ROLLBACK
-- END

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--d)    Crie uma trigger que faça exclusão em cascata todas as vezes que um projeto for excluído do banco de dados

--CREATE TRIGGER tg_exclusaoProjetoCascata
--ON TB_Projeto
--AFTER DELETE 
--AS
--IF EXISTS (SELECT * 
-- FROM DELETED)
-- BEGIN 
-- DELETE FROM TB_Departamento_Projeto 
-- WHERE Numero_Projeto = Numero_Projeto
-- END
-- BEGIN 
-- DELETE FROM TB_Empregado_Projeto 
-- WHERE Numero_Projeto = Numero_Projeto 
-- END

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--e)    Adicione o atributo hora_total na tabela projeto. Em seguida, crie uma trigger evite que sejam inseridos projetos com mais de 2.000 horas no total.

--ALTER TABLE TB_Projeto ADD Hora_Total integer;

--CREATE TRIGGER tg_evitaProjeto2000Horas ON TB_Projeto
--FOR INSERT
--AS
--IF EXISTS(SELECT Hora_Total FROM INSERTED WHERE Hora_Total IN (2000))
--BEGIN
--	PRINT 'O total de horas do projeto não pode ser maior que 2000hrs.'
--	ROLLBACK
--END

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--f)    Adicione o atributo mês (atributo do tipo inteiro) na tabela Empregado_Projeto. Em seguida, crie uma trigger que seja disparada sempre um registro for inserido na tabela Empregado_Projeto. Essa trigger deve verificar se o número total de horas de um funcionário (fazer o somatório do número de horas para o empregado) no mês corrente não excede 180 horas. Se exceder, o o registro não poderá ser inserido e o funcionário deve receber uma mensagem notificando o ocorrido.
-- if(mes > 180)..

--ALTER TABLE TB_Empregado_Projeto ADD Mes integer;

--CREATE TRIGGER tg_evitaProjeto2000Horas ON TB_Empregado_Projeto
--FOR INSERT, UPDATE
--AS

--DECLARE @RgEmpregado character(8)
--DECLARE @Mes integer
--DECLARE @Horas integer

--IF EXISTS(SELECT RG_Empregado, Horas, Mes FROM INSERTED WHERE @Mes = Mes)
--BEGIN
-- SET @RgEmpregado = COUNT((@RgEmpregado))
-- SET @Mes = SUM(@Horas  * @RgEmpregado)
-- IF(@Mes > 180)
-- BEGIN
--  PRINT 'Caro empregado, o total de horas do seu mês está maior que as 180hrs esperadas, está tento problemas?'
--  ROLLBACK
-- END
--END

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--g)    Crie uma trigger para inserção e atualização que evite que sejam inseridos ou atualizados novos projetos na tabela Projetos em que o campo CIDADE diferente de ‘Curitiba’ ou ‘São Paulo’.

--CREATE TRIGGER tg_NaoPermiteEstados
--ON TB_Projeto
--FOR INSERT
--AS
--IF EXISTS (SELECT *
-- FROM INSERTED
-- WHERE Cidade_Projeto IN ('Curitiba', 'Sao Paulo'))
-- BEGIN
-- PRINT 'INSERÇÃO EXECUTADA - ESTADO PERMITIDO!'
-- END
--ELSE
--PRINT 'INSERÇÃO DE REGISTRO CANCELADA.'
--PRINT 'ESTADO (UF) DIFERENTES DE curitiba OU sao paulo SAO PROIBIDOS!!'
--ROLLBACK

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--h)    Crie uma trigger para inserção que atualize o valor do salário de um emprega em (adicione R$50,00 ao salário do empregado) todas as vezes que um empregado se envolver em um novo projeto.

--CREATE TRIGGER tg_bonificacaoEmpregadoProjeto
--ON TB_Empregado
--FOR UPDATE
--AS
-- DECLARE @qtdProjetos int
-- DECLARE @RgEmpregado char
-- DECLARE @bonification money
-- DECLARE @salario money
--IF EXISTS (SELECT *
-- FROM INSERTED, TB_Empregado_Projeto ep
-- WHERE ep.RG_Empregado = @RgEmpregado AND inserted.Salario_Empregado = @salario)
-- BEGIN
--	 SET @qtdProjetos = COUNT(@RgEmpregado)
--	 SET @bonification = SUM(50 * @qtdProjetos)
--	 SET @salario = SUM(@salario + @bonification)
-- END

--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

--i)    Crie uma trigger para exclusão que não permita excluir nenhum registro da tabela Projetos em que o campo CIDADE seja igual a ‘Curitiba’ ou ‘São Paulo’.

--CREATE TRIGGER tg_NaoPermiteExcluirEstados
--ON TB_Projeto
--FOR DELETE
--AS
--IF EXISTS (SELECT *
-- FROM DELETED
-- WHERE Cidade_Projeto IN ('Curitiba', 'Sao Paulo'))
-- BEGIN
-- PRINT 'PROIBIDO EXCLUIR CIDADES DE curitiba E sao paulo'
-- ROLLBACK
-- END
--ELSE
--PRINT 'ITEM EXCLUIDO COM SUCESSO!'



--**-------------------------------------------------------------------**----------------------------------------------------------------------------**---------------------------------------------------------------------------**----------------------------------------------**--

