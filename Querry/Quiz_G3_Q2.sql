--ALUNO: ÁNDRE LUIZ BRANCO BELEM MYSZKO
--RA: 2019102420

----------------------------------------------------------------------------------------------------------------------------------------------
--Questão.2 
--Escreva comandos SQL para encontrar empregados que estejam no "top 3" de cada departamento. Retornar as informações independente de ordem.
-- Explicação:
-- No Departamento IT, o Max recebe o maior salário. Tanto Randy como Joes recebem os 2o. maior salário.
-- e Will recebe o 3o. maior salário. 
-- Existem apenas 2 empregados no departamento Sales
-- Henry recebe o maior salário e San recebe o 2o. maior salário.
-----------------------------------------------------------------------------------------------------------------------------------------------

--OBS:. PROFESSOR, OS INSERTS, EU FIZ UMA A UM, NA MESMA LINHA COM "F5", E DEIXEI "---ISERT..." NA LINHA ABAIXO  :/ 
--NA SEMANA QUE VEM, SE O SR QUISER EU MOSTRO NO MEU PC NA AULA ELE FUNCIONANDO SEM PROBLEMA, OK?
--SE NÃO VOU TER QUE FICAR CRIANDO OS INSERTS COM AS DATAS DIFERENTES PARA GERAR DADOS, QUERO ENTREGAR HJ E DAR UMA BOA OLHA NO SEU CÓDIGO COM A TRIGGER DA QUESTAO-1!

-----------------------------------------------------------------------------------------------------------------------
create database Quiz_SQL_grupo3
use Quiz_SQL_grupo3
-----------------------------------------------------------------------------------------------------------------------

create table TB_Pedido(
	pedido_id integer identity(1,1) primary key,
	cliente_id integer,
	pedido_data date,
	quantidade integer,
	item_id integer,
	constraint item_id foreign key (item_id) references TB_Item		
);

insert into TB_Pedido values(4, '2020-06-06', 9, 4 ); 
--insert...
-----------------------------------------------------------------------------------------------------------------------

create table TB_Item(
	item_id integer identity(1,1) primary key,
	item_nome varchar(40),
	item_categoria varchar(40)
);

insert into TB_Item values('perfume', 'COSMETICO' );
--insert...
-----------------------------------------------------------------------------------------------------------------------

create table TB_Empregado(
	empregado_id integer identity(1,1) primary key,
	empregado_nome  varchar(40),
	salario money,
	dapartamento_id integer,
	constraint dapartamento_id foreign key (dapartamento_id) references TB_Departamento
);

insert into TB_Empregado values ('pedro', 4985, 4);
--insert...
-----------------------------------------------------------------------------------------------------------------------

create table TB_Departamento(
	dapartamento_id integer identity(1,1) primary key,
	departamento_nome varchar(40)
);

insert into TB_Departamento values('Assistencia');
insert into TB_Departamento values('Compras');
insert into TB_Departamento values('Engenharia');
insert into TB_Departamento values('Suporte');
insert into TB_Departamento values('Vendas');
--NESSE CASO TENHO QUE COLOCAR EXATAMENTE OS MESMOS DEPARTAMENTOS QUE USEI, POR CAUSA DO MÉTODO QUE UTILIZEI.

-----------------------------------------------------------------------------------------------------------------------

select * from TB_Item
select * from TB_Pedido
select * from TB_Empregado
select * from TB_Departamento

-----------------------------------------------------------------------------------------------------------------------

DECLARE @depNome varchar(40)
DECLARE @empNome varchar(40)
DECLARE @empSalario money

DECLARE cr_DepartamentoEmpregadoSalario CURSOR
	FOR 
	SELECT TOP 3 departamento_nome, empregado_nome, salario FROM TB_Departamento de, TB_Empregado em
	WHERE departamento_nome='Assistencia' AND de.dapartamento_id = em.dapartamento_id 
	UNION
	SELECT TOP 3 departamento_nome, empregado_nome, salario FROM TB_Departamento de, TB_Empregado em
	WHERE departamento_nome='Compras' AND de.dapartamento_id = em.dapartamento_id
	UNION
	SELECT TOP 3 departamento_nome, empregado_nome, salario FROM TB_Departamento de, TB_Empregado em
	WHERE departamento_nome='Engenharia' AND de.dapartamento_id = em.dapartamento_id
	UNION
	SELECT TOP 3 departamento_nome, empregado_nome, salario FROM TB_Departamento de, TB_Empregado em
	WHERE departamento_nome='Suporte' AND de.dapartamento_id = em.dapartamento_id
	UNION
	SELECT TOP 3 departamento_nome, empregado_nome, salario FROM TB_Departamento de, TB_Empregado em
	WHERE departamento_nome='Vendas' AND de.dapartamento_id = em.dapartamento_id

ORDER BY departamento_nome, salario DESC;

OPEN cr_DepartamentoEmpregadoSalario
	FETCH NEXT FROM cr_DepartamentoEmpregadoSalario
		INTO @depNome, @empNome, @empSalario

			PRINT 'Departamentos e seus top 3 empregados por salário:'
			PRINT '--------------------------------------------------'

	WHILE @@FETCH_STATUS = 0
		
		BEGIN
			PRINT @depNome + ' - ' + @empNome + ' - ' + CONVERT(varchar(12), @empSalario) 
			FETCH NEXT FROM cr_DepartamentoEmpregadoSalario
				INTO @depNome, @empNome, @empSalario

		END
		PRINT '--------------------------------------------------'

CLOSE cr_DepartamentoEmpregadoSalario
DEALLOCATE cr_DepartamentoEmpregadoSalario

-----------------------------------------------------------------------------------------------------------------------
