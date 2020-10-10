﻿/*CREATE DATABASE mercadinho*/

/* CRIA��O DAS TABELAS  */
/*CREATE TABLE TB_Cliente
( CodCliente INT IDENTITY(1,1) PRIMARY KEY,
  NomeCliente VARCHAR(50),
  TelefoneCliente VARCHAR(15),
  DataCadastroCliente DATE)

CREATE TABLE TB_Pagamento
( CodPagamento INT IDENTITY(1,1) PRIMARY KEY,
  CodCliente INT,
  CodPedido INT,
  ValorPagamento DECIMAL(8,2),
  DataPagamento DATE)

CREATE TABLE TB_Vendedor
(CodVendedor INT IDENTITY(1,1) PRIMARY KEY,
  NomeVendedor VARCHAR(50),
  RGVendedor   VARCHAR(15),
  DataAdmissaoVendedor DATE)

CREATE TABLE TB_Pedido
( CodPedido   INT IDENTITY(1,1) PRIMARY KEY,
  DataPedido  DATE,
  CodCliente  INT,
  CodVendedor INT)

CREATE TABLE TB_Produto
( CodProduto INT IDENTITY(1,1) PRIMARY KEY,
  NomeProduto VARCHAR(50),
  ValorProduto DECIMAL(5,2))

CREATE TABLE TB_PedidoItem
( CodPedidoItem INT IDENTITY(1,1) PRIMARY KEY,
  CodPedido INT,
  CodProduto INT)*/

/*ALTER TABLE TB_Pagamento  WITH CHECK 
ADD  CONSTRAINT FK_TBPagamento_TBCliente
FOREIGN KEY(CodCliente) REFERENCES TB_Cliente (CodCliente)

ALTER TABLE TB_Pagamento  WITH CHECK 
ADD  CONSTRAINT FK_TBPagamento_TBPedido
FOREIGN KEY(CodPedido) REFERENCES TB_Pedido (CodPedido)

ALTER TABLE TB_Pedido  WITH CHECK 
ADD  CONSTRAINT FK_TBPedido_TBCliente
FOREIGN KEY(CodCliente) REFERENCES TB_Cliente (CodCliente)

ALTER TABLE TB_Pedido  WITH CHECK 
ADD  CONSTRAINT FK_TBPedido_TBVendedor
FOREIGN KEY(CodVendedor) REFERENCES TB_Vendedor (CodVendedor)

ALTER TABLE TB_PedidoItem  WITH CHECK 
ADD  CONSTRAINT FK_TBPedidoItem_TBPedido
FOREIGN KEY(CodPedido) REFERENCES TB_Pedido (CodPedido)

ALTER TABLE TB_PedidoItem  WITH CHECK 
ADD  CONSTRAINT FK_TBPedidoItem_TBProduto
FOREIGN KEY(CodProduto) REFERENCES TB_Produto (CodProduto)*/

/*  INSERT DE DADOS ALEAT�RIOS    */
-- 5 vendedores

/*INSERT INTO dbo.TB_Vendedor (NomeVendedor, RGVendedor, DataAdmissaoVendedor)
       VALUES (NEWID(), 
       CONVERT(VARCHAR,(CONVERT(INT,(RAND()*100000000+1)))) , 
       CONVERT(DATE,CONVERT(DATETIME, CONVERT(INT,(RAND()*356)+40710))))
GO 5*/

-- 1.000 Clientes
/*INSERT INTO TB_Cliente (NomeCliente, TelefoneCliente, DataCadastroCliente)
       VALUES (NEWID(), '(XX) 1234-5678', CONVERT(DATE,CONVERT(DATETIME, CONVERT(INT,(RAND()*356)+40710))))
GO 1000

-- 100 Produtos
INSERT INTO TB_Produto(NomeProduto, ValorProduto)
VALUES ( NEWID(), CONVERT(DECIMAL(5,2),(RAND()*100)+1,2)  )
GO 100

-- 200 Pedidos por vendedor
WITH Clientes AS
(SELECT CodCliente, CONVERT(DATE, DATEADD(DAY,RAND()*100,CONVERT(DATETIME, DataCadastroCliente))) [DataCadastroCliente]
FROM TB_Cliente
WHERE CodCliente = CONVERT(INT,(RAND()*10000)+1) )
INSERT INTO TB_Pedido(CodCliente,DataPedido,CodVendedor)
SELECT CodCliente, DataCadastroCliente,1 FROM Clientes
GO 200

WITH Clientes AS
(SELECT CodCliente, CONVERT(DATE, DATEADD(DAY,RAND()*100,CONVERT(DATETIME, DataCadastroCliente))) [DataCadastroCliente]
FROM TB_Cliente
WHERE CodCliente = CONVERT(INT,(RAND()*10000)+1) )
INSERT INTO TB_Pedido(CodCliente,DataPedido,CodVendedor)
SELECT CodCliente, DataCadastroCliente,2 FROM Clientes
GO 200

WITH Clientes AS
(SELECT CodCliente, CONVERT(DATE, DATEADD(DAY,RAND()*100,CONVERT(DATETIME, DataCadastroCliente))) [DataCadastroCliente]
FROM TB_Cliente
WHERE CodCliente = CONVERT(INT,(RAND()*10000)+1) )
INSERT INTO TB_Pedido(CodCliente,DataPedido,CodVendedor)
SELECT CodCliente, DataCadastroCliente,3 FROM Clientes
GO 200

-- 1000 Itens nos Pedidos
INSERT INTO TB_PedidoItem(CodPedido, CodProduto)
SELECT (SELECT CONVERT(INT,RAND()*MAX(CodPedido)-1) FROM TB_Pedido)
,(SELECT CONVERT(INT,RAND()*MAX(CodProduto)-1) FROM TB_Produto)
GO 1000*/
