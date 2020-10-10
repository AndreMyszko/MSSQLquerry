/*-- Itens de Pagamento
INSERT INTO TB_Pagamento (CodCliente, CodPedido, ValorPagamento, DataPagamento)
   SELECT PE.CodCliente, PE.CodPedido, SUM(PR.ValorProduto), CONVERT(DATE, DATEADD(DAY,RAND()*5, CONVERT(DATETIME,PE.DataPedido))) 
FROM TB_Pedido PE
INNER JOIN TB_PedidoItem PI ON PE.CodPedido = PI.CodPedido
INNER JOIN TB_Produto PR ON PR.CodProduto = PI.CodProduto
GROUP BY PE.CodCliente, PE.CodPedido, CONVERT(DATE, DATEADD(DAY,RAND()*5, CONVERT(DATETIME,PE.DataPedido)))
ORDER BY CodCliente, CodPedido*/

/*select TB_Cliente.NomeCliente from TB_Cliente*/

/*create view produtosMaisVendidos  
as
 select distinct TB_Produto.*
 from TB_Produto
 join TB_PedidoItem ON TB_Produto.CodProduto = TB_PedidoItem.CodPedido
GO*/

