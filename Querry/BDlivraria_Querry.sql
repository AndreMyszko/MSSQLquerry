--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
ALUNO: Andre Luiz Branco Belem Myszko
RA: 2019102420
(Eng. Software - Presencial - Noite)
*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*DROP DATABASE IF EXISTS BD_livraria;*/

--CREATE DATABASE BD_livraria;

--CREATE TABLE TB_Autor
--(
--	CodAutor INT IDENTITY (1,1) CONSTRAINT PK_TB_Autor PRIMARY KEY,
--	NomeAutor VARCHAR(80) CONSTRAINT NNNomeAutor NOT NULL,
--	Sexo CHAR(1) CONSTRAINT CKSexoAutor CHECK (Sexo IN ('M','F')) NOT NULL
--);

--CREATE TABLE TB_Livro
--(
--	CodLivro INT IDENTITY (1,1) CONSTRAINT PK_TB_Livro PRIMARY KEY,
--	CodAutor INT CONSTRAINT FK_TB_Livro_TB_Autor FOREIGN KEY (CodAutor) REFERENCES TB_Autor (CodAutor),
--	TituloLivro VARCHAR(40) CONSTRAINT NNTituloLivro NOT NULL,
--	Genero VARCHAR(20) CONSTRAINT NNGenero NOT NULL,
--  ValorLivro MONEY CONSTRAINT NNValorLivro NOT NULL
--);

--CREATE TABLE TB_Cliente
--(
--	CodCliente INT IDENTITY (1,1) CONSTRAINT PK_TB_Cliente PRIMARY KEY,
--	NomeCliente VARCHAR(80) CONSTRAINT NNNomeCliente NOT NULL,
--	DataNascimento DATE CONSTRAINT NNDataNascimento NOT NULL,
--  Sexo CHAR(1) CONSTRAINT CKSexoCliente CHECK (Sexo IN ('M','F')) NOT NULL
--);

--CREATE TABLE TB_Cidade
--(
--	CodMunicipio INT IDENTITY (1,1) CONSTRAINT PK_TB_Cidade PRIMARY KEY,
--	NomeMunicipio VARCHAR(30) CONSTRAINT NNNomeMunicipio NOT NULL,
--	UF VARCHAR(2) CONSTRAINT NNUF NOT NULL,
--	Regiao CHAR(20) CONSTRAINT NNRegiao NOT NULL
--);

--CREATE TABLE TB_Venda
--(
--	CodVenda INT IDENTITY (1,1) CONSTRAINT PK_TB_Venda PRIMARY KEY,
--	DataVenda DATE CONSTRAINT NNDataVenda NOT NULL,
--	CodCliente INT CONSTRAINT FK_TB_Venda_TB_Cliente FOREIGN KEY (CodCliente) REFERENCES TB_Cliente (CodCliente) NOT NULL,
--  CodMunicipio INT CONSTRAINT FK_TB_Venda_TB_Cidade FOREIGN KEY (CodMunicipio) REFERENCES TB_Cidade (CodMunicipio) NOT NULL
--);

--CREATE TABLE TB_VendaLivro
--(
--	CodVenda INT NOT NULL,
--	CodLivro INT NOT NULL,
--	CONSTRAINT PK_TB_VendaLivro PRIMARY KEY(CodVenda, CodLivro), 
--  CONSTRAINT FK_TB_VendaLivro_TB_Venda FOREIGN KEY (CodVenda) REFERENCES TB_Venda(CodVenda), 
--  CONSTRAINT FK_TB_VendaLivro_TB_Livro FOREIGN KEY (CodLivro) REFERENCES TB_Livro(CodLivro)
--);

--********************************************//*********************************************//*************************************************//***************************************************//*************************************************--

--INSERT INTO TB_Autor VALUES ('William Shakespeare', 'M');
--INSERT INTO TB_Autor VALUES ('J. K. Rowling', 'F');


--INSERT INTO TB_Livro VALUES ((SELECT CodAutor FROM TB_Autor WHERE NomeAutor = 'William Shakespeare'), 'Sonho de uma Noite de Verao', 'Comedia', 33.52);
--INSERT INTO TB_Livro VALUES ((SELECT CodAutor FROM TB_Autor WHERE NomeAutor = 'William Shakespeare'), 'O Mercador de Veneza', 'Comodia Tragica', 45.67);
--INSERT INTO TB_Livro VALUES ((SELECT CodAutor FROM TB_Autor WHERE NomeAutor = 'William Shakespeare'), 'A Comedia dos Erros', 'Comedia', 25.00);
--INSERT INTO TB_Livro VALUES ((SELECT CodAutor FROM TB_Autor WHERE NomeAutor = 'J. K. Rowling'), 'Harry Potter e a Pedra Filosofal', 'Fantasia', 20.00);
--INSERT INTO TB_Livro VALUES ((SELECT CodAutor FROM TB_Autor WHERE NomeAutor = 'J. K. Rowling'), 'Harry Potter e o Prisioneiro de Askaban', 'Fantasia', 20.00);


--INSERT INTO TB_Cliente VALUES ('Miguel Roberto Manuel Monteiro', '1997-08-12', 'M');
--INSERT INTO TB_Cliente VALUES ('Nathan Matheus Ferreira', '1997-12-04', 'M');
--INSERT INTO TB_Cliente VALUES ('Yago Erick Moura', '1993-08-10', 'M');
--INSERT INTO TB_Cliente VALUES ('Marli Isis Agatha da Rocha', '1998-01-12', 'F');
--INSERT INTO TB_Cliente VALUES ('Alana Luana Campos', '1989-10-07', 'F');
--INSERT INTO TB_Cliente VALUES ('Fernanda Letecia Nogueira', '1987-07-11', 'F');
--INSERT INTO TB_Cliente VALUES ('Alexandre Jose da Cunha', '1989-07-12', 'M');


--INSERT INTO TB_Cidade VALUES ('CURITIBA', 'PR', 'SUL');
--INSERT INTO TB_Cidade VALUES ('MARINGA', 'PR', 'SUL');
--INSERT INTO TB_Cidade VALUES ('FLORIANOPOLIS', 'SC', 'SUL');


--INSERT INTO TB_Venda VALUES ('2018-09-17', (SELECT CodCliente FROM TB_Cliente WHERE NomeCliente = 'Miguel Roberto Manuel Monteiro'), (SELECT CodMunicipio FROM TB_Cidade WHERE NomeMunicipio = 'CURITIBA'));
--INSERT INTO TB_Venda VALUES ('2018-01-10', (SELECT CodCliente FROM TB_Cliente WHERE NomeCliente = 'Nathan Matheus Ferreira'), (SELECT CodMunicipio FROM TB_Cidade WHERE NomeMunicipio = 'CURITIBA'));
--INSERT INTO TB_Venda VALUES ('2018-04-20', (SELECT CodCliente FROM TB_Cliente WHERE NomeCliente = 'Yago Erick Moura'), (SELECT CodMunicipio FROM TB_Cidade WHERE NomeMunicipio = 'CURITIBA'));
--INSERT INTO TB_Venda VALUES ('2018-05-12', (SELECT CodCliente FROM TB_Cliente WHERE NomeCliente = 'Alana Luana Campos'), (SELECT CodMunicipio FROM TB_Cidade WHERE NomeMunicipio = 'MARINGA'));
--INSERT INTO TB_Venda VALUES ('2018-06-15', (SELECT CodCliente FROM TB_Cliente WHERE NomeCliente = 'Fernanda Letecia Nogueira'), (SELECT CodMunicipio FROM TB_Cidade WHERE NomeMunicipio = 'MARINGA'));
--INSERT INTO TB_Venda VALUES ('2018-07-10', (SELECT CodCliente FROM TB_Cliente WHERE NomeCliente = 'Alexandre Jose da Cunha'), (SELECT CodMunicipio FROM TB_Cidade WHERE NomeMunicipio = 'FLORIANOPOLIS'));


--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Miguel Roberto Manuel Monteiro'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'A Comedia dos Erros'));
--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Miguel Roberto Manuel Monteiro'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'Harry Potter e a Pedra Filosofal'));
--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Nathan Matheus Ferreira'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'Sonho de uma Noite de Vereo'));
--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Nathan Matheus Ferreira'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'O Mercador de Veneza'));
--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Yago Erick Moura'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'Sonho de uma Noite de Vereo'));
--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Yago Erick Moura'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'O Mercador de Veneza'));
--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Yago Erick Moura'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'Harry Potter e o Prisioneiro de Askaban'));
--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Alana Luana Campos'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'A Comedia dos Erros'));
--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Fernanda Leticia Nogueira'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'A Comedia dos Erros'));
--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Alexandre Jose da Cunha'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'A Comedia dos Erros'));
--INSERT INTO TB_VendaLivro VALUES ((SELECT V.CodVenda FROM TB_Venda AS V INNER JOIN TB_Cliente AS C ON C.CodCliente = V.CodCliente WHERE C.NomeCliente = 'Alexandre Jose da Cunha'), (SELECT CodLivro FROM TB_Livro WHERE TituloLivro = 'Harry Potter e a Pedra Filosofal'));

--*****************************************************//**************************************************************//*****************************************************//*****************************************//*****************************--

/*USE DB_livraria;*/
--SELECT * FROM TB_VendaLivro;
--SELECT * FROM TB_Venda;
--SELECT * FROM TB_Livro;
--SELECT * FROM TB_Cidade;
--SELECT * FROM TB_Cliente;
--SELECT * FROM TB_Autor;

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--a)Crie uma View que selecione os nomes de todos os autores e o nome dos livros;

--CREATE VIEW vw_autorLivro AS 
--SELECT TituloLivro FROM TB_Livro l
--join TB_Autor a
--ON l.TituloLivro = a.NomeAutor

--ALTER VIEW [dbo].[vw_autorLivro] AS 
--SELECT NomeAutor, TituloLivro FROM TB_Autor a 
--join TB_Livro l
--ON  a.NomeAutor = NomeAutor AND TituloLivro = l.TituloLivro
--GO

--SELECT * FROM vw_autorLivro

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--b)Crie uma View que selecione quantos livros foram vendidos por município

--ALTER VIEW vw_livrosVendidosMunicipio AS
--SELECT c.NomeMunicipio, COUNT(l.CodLivro) qtd
--FROM TB_Venda AS v 
--CROSS JOIN TB_Cidade AS c
--CROSS JOIN TB_Livro AS l
--CROSS JOIN TB_VendaLivro vl
--WHERE v.CodVenda = vl.CodVenda AND l.CodLivro = vl.CodLivro 
--GROUP BY c.NomeMunicipio

--SELECT * FROM vw_livrosVendidosMunicipio ORDER BY NomeMunicipio

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--c)Crie uma sp para inserir livros

--ALTER PROCEDURE sp_inserirLivro
--	@CodLivro INT,
--	@TituloLivro VARCHAR(40),
--	@Genero VARCHAR(20),
--	@ValorLivro MONEY 
--AS
--BEGIN
--	SET IDENTITY_INSERT TB_Livro ON;
--	INSERT INTO TB_Livro
--	(
--		CodLivro,
--		TituloLivro,
--		Genero,
--		ValorLivro
--	)
--	VALUES
--	(
--		@CodLivro,
--		@TituloLivro,
--		@Genero,
--		@ValorLivro
--	)
--END

--EXEC sp_inserirLivro 44, 'asde', 'asde', 99.99

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--d)Crie uma sp onde o usuário entre com o código do livro e seja possível identificar o título do livro e a(s) cidade(s) que comprou o livro.

--ALTER PROCEDURE sp_buscarLivroPorCodigo 
--	@CodLivro INT
--AS
--BEGIN
--SELECT 
--	l.TituloLivro,
--	c.NomeMunicipio
--FROM 
--TB_Livro l 
--CROSS JOIN TB_Cidade c
--CROSS JOIN TB_Venda v
--CROSS JOIN TB_VendaLivro vl
--WHERE 
--@CodLivro = vl.CodLivro 
--AND 
--c.CodMunicipio = v.CodMunicipio
--END

--EXEC sp_buscarLivroPorCodigo 4

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--e)Crie uma sp onde o usuário entre com o código do autor e esse autor seja apagado do BD. Os livros que esse autor fornece e as vendas realizadas para esses livros também devem ser apagadas.

--ALTER PROCEDURE sp_excluirAutor
--	@CodAutor int
--AS
--BEGIN
--DELETE FROM	TB_Autor  
--WHERE TB_Autor.CodAutor = @CodAutor
--END

--EXEC sp_excluirVendasPorEstado 1

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--f)Crie uma sp que tenha como parâmetro de entrada duas datas e que forneça o nome dos livros comprados no intervalo de datas.

--CREATE PROCEDURE sp_compraLivrosData
--(
--@CodLivro int,
--@DataInicial smalldatetime,
--@DataFinal smalldatetime
--)
--AS
--SELECT
--TituloLivro,
--DataVenda
--FROM TB_Livro l
--CROSS JOIN TB_VendaLivro vl
--CROSS JOIN TB_Venda v
--WHERE l.CodLivro = @CodLivro And
--((DataVenda BETWEEN @DataInicial AND @DataFinal) or
--(DataVenda BETWEEN @DataInicial AND @DataFinal))

--EXEC sp_compraLivrosData 1, '2018-08-17', '2020-12-17'


--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--g)Crie uma sp que tenha como parâmetro de entrada o código do livro seja possível saber quantos livros (daquele passado por parâmetro) foram vendidos por cidade.

--CREATE PROCEDURE sp_vendaLivroCidade
--	(@CodLivro INT) 
--AS
--BEGIN
--SELECT
--TituloLivro as 'Titulo',
--NomeMunicipio as 'Cidade'
--FROM TB_VendaLivro vl, TB_Livro l, TB_Cidade c

--WHERE l.CodLivro = @CodLivro 
--END

--EXEC sp_vendaLivroCidade 1


--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--h)Crie uma sp onde o usuário entre com parâmetro de entrada “estado” e o sistema apague todas as linhas da tabela vendas e cidades para aquele estado.

--CREATE PROCEDURE sp_excluirVendasPorEstado
--	@UF varchar(2),
--	@CodMunicipio int
--AS
--BEGIN
--DELETE FROM	TB_Cidade
--WHERE TB_Cidade.UF = @UF
--END

--EXEC sp_excluirVendasPorEstado 'PR'

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--i)Crie uma sp que dê um aumento de 20% a todos os livros que custem até R$20,00 e um aumento de 15% para aqueles que custem mais de R$20,00.

--ALTER PROCEDURE sp_aumentoLivros
--AS
--BEGIN
--SELECT 
--	(CASE WHEN l.ValorLivro >= 20 THEN (l.ValorLivro + l.ValorLivro * 20 /100)  ELSE 
--	(CASE WHEN l.ValorLivro < 20 THEN (l.ValorLivro + l.ValorLivro * 15 /100) 
--END) END) as resultado
--	FROM TB_Livro l 	
--END
--EXEC sp_aumentoLivros

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--


--j)Crie uma sp que conte quantos livros (parâmetro de saída) de um determinado autor (passe como parâmetro o nome do autor) foram vendidos em um determinado período(parâmetros de entrada).

--ALTER PROCEDURE sp_vendaLivroPorAutorEData
--	@NomeAutor VARCHAR (40) OUTPUT,
--	@DataInicial smalldatetime,
--	@DataFinal smalldatetime
--	AS
--BEGIN
--SELECT
--	a.NomeAutor,
--	COUNT(vl.CodLivro) as 'Quantidade Vendida'
--FROM
--TB_Autor a, TB_Cidade c, TB_VendaLivro vl, TB_Livro l, TB_Venda v
--WHERE
--	@NomeAutor = a.NomeAutor AND
--	((DataVenda BETWEEN @DataInicial AND @DataFinal) or
--(DataVenda BETWEEN @DataInicial AND @DataFinal))
--GROUP BY a.NomeAutor
--END
--EXEC sp_vendaLivroPorAutorEData 'William Shakespeare', '2018-01-17', '2020-12-17'

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--k)Crie uma sp que faça a soma dos preços dos livros de um determinado autor. A soma dos preços será um parâmetro de saída e o nome do autor será um parâmetro de entrada.

--ALTER PROCEDURE sp_precoLivrosPorAutor
--	@NomeAutor VARCHAR(40)
--AS
--BEGIN
--SELECT 
--	l.TituloLivro, COUNT(l.ValorLivro) AS 'Soma Livros'
--FROM
--	TB_Livro l 
--  CROSS JOIN TB_VendaLivro vl 
--  CROSS JOIN TB_Venda v 
--  CROSS JOIN TB_Autor a
--  WHERE
--	@NomeAutor = a.NomeAutor 
--	AND 
--	a.CodAutor = l.CodAutor 
--GROUP BY 
--	l.TituloLivro
--END
--EXEC sp_precoLivrosPorAutor 'William Shakespeare'

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--l)Crie uma sp onde dada uma substring de um título, calcule a média dos preços dos livros para livros com a substring passada como parâmetro. A média dos preços deve ser um parâmetro de saída.

--CREATE PROCEDURE sp_mediaPrecoPorGenero
--	@Genero VARCHAR(40)
--AS
--BEGIN
--SELECT 
--	Genero, AVG(ValorLivro) as 'Media Valor Genero'
--FROM 
--	TB_Livro l
--WHERE
--	@Genero = l.Genero
--GROUP BY l.Genero
--END

--EXEC sp_mediaPrecoPorGenero 'Comedia'

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--m)Crie uma sp que calcule o valor total da venda por cliente.

--ALTER PROCEDURE sp_totalVendaPorCliente
--	@NomeCliente VARCHAR(40)
--AS
--BEGIN
--SELECT 
--	c.NomeCliente, SUM(ValorLivro) as 'Total Venda'
--FROM
--	TB_Cliente c
--	CROSS JOIN TB_Venda v
--	CROSS JOIN TB_Livro l
--WHERE 
--	@NomeCliente = c.NomeCliente 
--	AND 
--	c.CodCliente = v.CodCliente
--GROUP BY c.NomeCliente
--END

--EXEC sp_totalVendaPorCliente 'Yago Erick Moura'
--EXEC sp_totalVendaPorCliente 'Alana Luana Campos'

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--

--n)Criar uma function Scalar que achar mais adequada
--R: inserir o ID de um livro e retornar o seu nome e o gênero do livro.

--ALTER Function sc_LivroGenero(@CodLivro smallint)
--RETURNS Nchar(40)
--AS
--BEGIN
-- DECLARE @result Nchar(40)
-- SET @result=(SELECT TituloLivro + ' *** ' + Genero FROM TB_Livro
-- WHERE CodLivro=@CodLivro)
-- RETURN @result
--END

--SELECT dbo.sc_LivroGenero(1) as 'Resumo'
--FROM TB_Livro

--*******************************************************//*****************************************************************//*****************************************************//**********************************************//******************--
