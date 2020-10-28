--ALUNO: ÁNDRE LUIZ BRANCO BELEM MYSZKO
--RA: 2019102420

-------------------------------------------------------------------------------------------------------------------------
---- Questão.1
---- Escreva comandos SQL para apresentar quantas unidades em cada categoria foram ordenadas em cada dia da semana.
---- Você é um empresário e gostaria de obter um relatório de vendas por categoria, itens e dia da semana
---- Retorne o resultado ordenado por categoria
---- Na Segunda (2020-06-01, 2020-06-08) foram vendidos um total de 20 unidades (10 + 10) da categoria Book (ids: 1, 2).
---- Na Terça (2020-06-02) foram vendidos um total de 5 unidades da categoria Book (ids: 1, 2).
---- Na Quarta (2020-06-03) foram vendidos um total de 5 unidades in the categoria Phone (ids: 3, 4).
---- Na Thursday (2020-06-04) foi vendido um total de 1 unidade na categoria Phone (ids: 3, 4).
---- Na Sexta (2020-06-05) foram vendidos um total de 10 unidades na categoria Book (ids: 1, 2) e 5 unidades na categoria Glasses (ids: 5).
---- No Sábado não foram vendidos itens.
---- No Domingo (2020-06-14, 2020-06-21) foram vendidos um total de 10 unidades (5 +5) na categoria Phone (ids: 3, 4).
---- Não houve vendas de T-Shirt.
-------------------------------------------------------------------------------------------------------------------------

----OBS:.CRIEI UM BANCO NOVO PQ O TRIGGER DA TABELA RELATORIO TAVA CONFLITANDO COM A FK_ID_ITEM DE UMA TABELA QUE EU JA HAVIA CRIADO ANTERIORMENTE NO Quiz_SQL_grupo3. (PQ EU MUDEI O NOME PARA TB_PEDIDO, NESSE AQUI DEIXEI COMO "PEDIDO" APENAS)
---- DEIXEI OS EXECUTES DO CÓDIGO SEPARADO POR "-----".

-------------------------------------------------------------------------------------------------------------------------

create database Quiz_SQL_grupo3_Q2
use Quiz_SQL_grupo3_Q2
-------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Relatorio  (
   categoria varchar (20),
   segunda int,
   terca   int,
   quarta  int,
   quinta  int,
   sexta   int,   
   sabado  int,
   domingo int)
-------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ITEM (
   item_id int IDENTITY(1,1) PRIMARY KEY,
   item_nome varchar(15),
   item_categoria varchar(10))
-------------------------------------------------------------------------------------------------------------------------

CREATE TRIGGER TG_Insere_Categoria
ON Item FOR INSERT AS
IF EXISTS (SELECT * FROM INSERTED)
	BEGIN
	   IF NOT EXISTS (SELECT categoria FROM Relatorio
					  WHERE RELATORIO.categoria = (select item_categoria FROM inserted))
			BEGIN
				PRINT 'INSERCAO DE REGISTRO EM RELATORIO:'
				INSERT INTO Relatorio VALUES((select item_categoria FROM inserted),		0, 0, 0, 0, 0, 0, 0) 
			END
		ELSE
		   PRINT 'NAO FEZ INSERT - JA EXISTIA A  Categoria no Relatorio!'
	END
-------------------------------------------------------------------------------------------------------------------------

INSERT INTO Item VALUES ('LC Alg. Book', 'Book')
INSERT INTO Item VALUES ('LC DB. Book', 'Book')
INSERT INTO Item VALUES ('LC SmarthPhone', 'Phone')
INSERT INTO Item VALUES ('LC Phone 2020', 'Phone')
INSERT INTO Item VALUES ('LC SmartGlass', 'Glasses')
INSERT INTO Item VALUES ('LC T-Shirt XL', 'T-Shirt')

SELECT * FROM Item
-------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Pedido (
   pedido_id int IDENTITY(1,1) PRIMARY KEY,
   cliente_id int,
   pedido_data date,
   item_id int,
   quantidade int,
   CONSTRAINT FK_Pedido_Item_id FOREIGN KEY (item_id)
   REFERENCES Item(item_id)
   )
-------------------------------------------------------------------------------------------------------------------------
      
CREATE TRIGGER TG_Totaliza_Relatorio
ON Pedido FOR INSERT AS

IF EXISTS (SELECT * FROM INSERTED)
	BEGIN
     IF 'Sunday' = DATENAME(weekday, (SELECT pedido_data FROM INSERTED))
	      BEGIN
	         UPDATE Relatorio
	         SET domingo = domingo + (SELECT quantidade FROM INSERTED)
	         WHERE categoria = (SELECT item_categoria FROM INSERTED INNER JOIN Item 
								ON Item.item_id = inserted.item_id)
			 PRINT 'DOMINGO'					
	      END
	   IF 'Monday' = DATENAME(weekday, (SELECT pedido_data FROM INSERTED))
	      BEGIN
	         UPDATE Relatorio
	         SET segunda = segunda + (SELECT quantidade FROM INSERTED)
	         WHERE categoria = (SELECT item_categoria FROM INSERTED INNER JOIN Item 
								ON Item.item_id = inserted.item_id)
			 PRINT 'SEGUNDA-FEIRA'					
	      END
	   IF 'Tuesday' = DATENAME(weekday, (SELECT pedido_data FROM INSERTED))
	      BEGIN
	         UPDATE Relatorio
	         SET terca = terca + (SELECT quantidade FROM INSERTED)
	         WHERE categoria = (SELECT item_categoria FROM INSERTED INNER JOIN Item 
								ON Item.item_id = inserted.item_id)
			 PRINT 'TERCA-FEIRA'					
	      END
	   IF 'Wednesday' = DATENAME(weekday, (SELECT pedido_data FROM INSERTED))
	      BEGIN
	         UPDATE Relatorio
	         SET quarta = quarta + (SELECT quantidade FROM INSERTED)
	         WHERE categoria = (SELECT item_categoria FROM INSERTED INNER JOIN Item 
								ON Item.item_id = inserted.item_id)
			 PRINT 'QUARTA-FEIRA'					
	      END
	   IF 'Thursday' = DATENAME(weekday, (SELECT pedido_data FROM INSERTED))
	      BEGIN
	         UPDATE Relatorio
	         SET quinta = quinta + (SELECT quantidade FROM INSERTED)
	         WHERE categoria = (SELECT item_categoria FROM INSERTED INNER JOIN Item 
								ON Item.item_id = inserted.item_id)
			 PRINT 'QUINTA-FEIRA'					
	      END
	   IF 'Friday' = DATENAME(weekday, (SELECT pedido_data FROM INSERTED))
	      BEGIN
	         UPDATE Relatorio
	         SET sexta = sexta + (SELECT quantidade FROM INSERTED)
	         WHERE categoria = (SELECT item_categoria FROM INSERTED INNER JOIN Item 
								ON Item.item_id = inserted.item_id)
			 PRINT 'SEXTA-FEIRA'					
	      END
	   IF 'Saturday' = DATENAME(weekday, (SELECT pedido_data FROM INSERTED))
	      BEGIN
	         UPDATE Relatorio
	         SET sabado = sabado + (SELECT quantidade FROM INSERTED)
	         WHERE categoria = (SELECT item_categoria FROM INSERTED INNER JOIN Item 
								ON Item.item_id = inserted.item_id)
			 PRINT 'SABADO'					
	      END
	END
-------------------------------------------------------------------------------------------------------------------------
   
INSERT INTO Pedido VALUES (1, '2020-06-01', 1,10)      
INSERT INTO Pedido VALUES (1, '2020-06-08', 2,10)
INSERT INTO Pedido VALUES (2, '2020-06-02', 1,5)
INSERT INTO Pedido VALUES (3, '2020-06-03', 3,5)
INSERT INTO Pedido VALUES (4, '2020-06-04', 4,1)
INSERT INTO Pedido VALUES (4, '2020-06-05', 5,5)
INSERT INTO Pedido VALUES (5, '2020-06-05', 1,10)
INSERT INTO Pedido VALUES (5, '2020-06-14', 4,5)
INSERT INTO Pedido VALUES (5, '2020-06-21', 3,5)

SELECT * FROM Pedido
-------------------------------------------------------------------------------------------------------------------------

SELECT * FROM Relatorio
ORDER BY categoria
-------------------------------------------------------------------------------------------------------------------------


------MESTRE, ESTE AQUI ERA O CÓDIGO QUE EU ESTAVA PREPARANDO... NO PONTO EM QUE EU PAREI.
------TAVA FICANDO GIGANTE, DIFÍCIL DE LIGAR A LÓGICA USANDO CURSOR...
------QUERIA PASSAR O PRIMEIRO SELECT PRA PEGAR DIAS DA SEMANA"WEEKDAY" E AS CATEGORIAS...
------E OUTRO PRA ADICIONAR OS ITENS VENDIDOS NA TAL DATA POR CADA CATEGORIA.
------FOI CAÓTICO, MAS TAMBÉM, NA HORA QUE O SR DEMONSTROU UTILIZACAO DAS VIEWS E TRIGGERS, EU ME TOQUEI... QUE PODIA TER UTILIZADOS ESSAS FERRAMENTAS PRA ME AJUDA TBM
------AQUI TEM AS TABLES DA QUESTAO 1 E 2 COM SUAS FKEYS E TUDO MAIS COM O CURSOR E UM SELECT QUE ESTAVA FAZENDO LA EMBAIXO...

-------------------------------------------------------------------------------------------------------------------------
--create table TB_Pedido(
--	pedido_id integer identity(1,1) primary key,
--	cliente_id integer,
--	pedido_data date,
--	quantidade integer,
--	item_id integer,
--	constraint item_id foreign key (item_id) references TB_Item		
--);

--insert into TB_Pedido values(4, '2020-06-06', 9, 4 ); 
--insert...
-------------------------------------------------------------------------------------------------------------------------

--create table TB_Item(
--	item_id integer identity(1,1) primary key,
--	item_nome varchar(40),
--	item_categoria varchar(40)
--);

--insert into TB_Item values('perfume', 'COSMETICO' );
--insert...
-------------------------------------------------------------------------------------------------------------------------

--create table TB_Empregado(
--	empregado_id integer identity(1,1) primary key,
--	empregado_nome  varchar(40),
--	salario money,
--	dapartamento_id integer,
--	constraint dapartamento_id foreign key (dapartamento_id) references TB_Departamento
--);

--insert into TB_Empregado values ('pedro', 4985, 4);
--insert...
-------------------------------------------------------------------------------------------------------------------------

--create table TB_Departamento(
--	dapartamento_id integer identity(1,1) primary key,
--	departamento_nome varchar(40)
--);

--insert into TB_Departamento values('Engenharia');
--insert...

-------------------------------------------------------------------------------------------------------------------------

--select * from TB_Item
--select * from TB_Pedido
--select * from TB_Empregado
--select * from TB_Departamento

-------------------------------------------------------------------------------------------------------------------------


------Nesta parte deixo os despojos mortais do meu antigo código 
----SELECT * FROM TB_Item
----SELECT * FROM TB_Pedido
----SELECT * FROM TB_Departamento

----SELECT item_categoria, pedido_data
----FROM TB_Item LEFT JOIN TB_Pedido
---- ON TB_Item.item_id = TB_Pedido.item_id
----   ORDER BY item_categoria


------ comando que eu tava tentando usar, mas na hora do aperto... tentei fazer os selects por data específica -> SELECT DATENAME(weekday, '2020-10-19')
------ queria fazer no esquema do cursor pq gostei mto dele, ainda estou assimilando as coisas, agora entendo melhor como utilizar triggers e views quando o retorno que voce deseja de um resultado é mais complexo eles são muito importantes


------poderia ter utilizado uma view aqui talvez pra facilitar pegar os valores de cada semana -> CREATE VIEW vw_diasSemana AS.... e arrumar alguma lógica, alguns valores 
----	--SESGUNDA
----	SELECT it.item_id as segunda FROM TB_Departamento de, TB_Pedido pe, TB_Item it
----	WHERE  it.item_id = pe.item_id AND pedido_data = '2020-06-01'
----	UNION
----	--TERCA
----	SELECT it.item_id as terca FROM TB_Departamento de, TB_Pedido pe, TB_Item it
----	WHERE  it.item_id = pe.item_id AND pedido_data = '2020-06-02'
----	UNION
----	--QUARTA
----	SELECT it.item_id as 'quarta' FROM TB_Departamento de, TB_Pedido pe, TB_Item it
----	WHERE  it.item_id = pe.item_id AND pedido_data = '2020-06-03'
----	UNION
----	--QUINTA
----	SELECT it.item_id as 'quinta' FROM TB_Departamento de, TB_Pedido pe, TB_Item it
----	WHERE  it.item_id = pe.item_id AND pedido_data = '2020-06-04'
----	UNION
----	--SEXTA
----	SELECT it.item_id as 'sexta' FROM TB_Departamento de, TB_Pedido pe, TB_Item it
----	WHERE  it.item_id = pe.item_id AND pedido_data = '2020-06-05'
----	UNION
----	--SABADO
----	SELECT it.item_id as 'sabado' FROM TB_Departamento de, TB_Pedido pe, TB_Item it
----	WHERE  it.item_id = pe.item_id AND pedido_data = '2020-06-06'
----	UNION
----	--DOMINGO
----	SELECT it.item_id as 'domingo' FROM TB_Departamento de, TB_Pedido pe, TB_Item it
----	WHERE  it.item_id = pe.item_id AND pedido_data = '2020-06-07'

----ORDER BY it.item_id;


----MÉTODO QUE EU ESTAVA TENTANDO UTILIZAR NA QUESTAO 1:
--DECLARE @itemID int
--DECLARE @pedidoID int
--DECLARE @itemCategoria varchar(40)
--DECLARE @quantidade int
--DECLARE @segunda date
--DECLARE @terca date
--DECLARE @quarta date
--DECLARE @quinta date
--DECLARE @sexta date
--DECLARE @sabado date
--DECLARE @domingo date

--	DECLARE cr_Legenda CURSOR
--		FOR 
--		SELECT item_categoria
--		FROM TB_Item LEFT JOIN TB_Pedido 
--		 ON TB_Item.item_id = TB_Pedido.item_id 
--		  ORDER BY pedido_data

--	OPEN cr_Legenda
--		FETCH NEXT FROM cr_Legenda
--			INTO @itemCategoria
--				PRINT 'Categoria ' + ' - ' + ' segunda ' + ' - ' + ' terça ' + ' - ' +  ' quarta ' + ' - ' +  ' quinta ' + ' - ' +  ' sexta ' + ' - ' +  ' sabado ' + ' - ' +  ' domingo '
--				PRINT '--------------------------------------------------------------------------------------'
--			BEGIN
		
		


--		DECLARE cr_VendasCategoriaSemana CURSOR
--			FOR 
--				SELECT item_categoria, quantidade, pedido_data, pedido_data, pedido_data, pedido_data, pedido_data, pedido_data, pedido_data 
--				FROM TB_Item LEFT JOIN TB_Pedido 
--				 ON TB_Item.item_id = TB_Pedido.item_id 
--				  ORDER BY item_categoria

--		OPEN cr_VendasCategoriaSemana
--			FETCH NEXT FROM cr_VendasCategoriaSemana
--				INTO @itemCategoria, @quantidade, @segunda, @terca, @quarta, @quinta, @sexta, @sabado, @domingo 

--			WHILE @@FETCH_STATUS = 0
--				BEGIN
--					PRINT @itemCategoria + ' - ' + 
--					CONVERT(varchar(10), @quantidade) + ' - ' +
--					CONVERT(varchar(10), @quantidade) + ' - ' +
--					CONVERT(varchar(10), @quantidade) + ' - ' +
--					CONVERT(varchar(10), @quantidade) + ' - ' +
--					CONVERT(varchar(10), @quantidade) + ' - ' +
--					CONVERT(varchar(10), @quantidade) + ' - ' +
--					CONVERT(varchar(10), @quantidade) 

--					FETCH NEXT FROM cr_VendasCategoriaSemana
--						INTO @itemCategoria, @quantidade, @segunda, @terca, @quarta, @quinta, @sexta, @sabado, @domingo 
--				END

--				PRINT CHAR(13)

--		CLOSE cr_VendasCategoriaSemana
--		DEALLOCATE cr_VendasCategoriaSemana





--	FETCH NEXT FROM cr_Legenda
--	INTO @itemCategoria 
 
--			END

--	CLOSE cr_Legenda
--	DEALLOCATE cr_Legenda

----MUITO OBRIGADO
