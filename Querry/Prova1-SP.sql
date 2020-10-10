--Aluno: André Luiz Branco Belem Myszko
--RA: 2019102420

--1) Crie e execute um stored procedure que receba por parâmetro o número do projeto e retorne a quantidade de empregados nesse projeto.
--**---------------------------------------------------------------------------------------------------**----**-------------------------
-- use TestaTrigger...

CREATE OR ALTER PROCEDURE vw_funcionariosPorProjeto 
	@NumProjeto int
AS 
BEGIN
SELECT p.Numero_Projeto, COUNT(ep.RG_Empregado) qtdFuncionarios
FROM TB_Projeto p, TB_Empregado_Projeto ep
WHERE @NumProjeto = p.Numero_Projeto AND p.Numero_Projeto = ep.Numero_Projeto
GROUP BY p.Numero_Projeto
END

EXEC vw_funcionariosPorProjeto 1701 --1
EXEC vw_funcionariosPorProjeto 1703 --2
EXEC vw_funcionariosPorProjeto 1704 --1
EXEC vw_funcionariosPorProjeto 1705 --0
EXEC vw_funcionariosPorProjeto 9999 --NULL

--**---------------------------------------------------------------------------------------------------**------**-------------------------
