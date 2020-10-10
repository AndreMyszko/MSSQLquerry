DECLARE @nomeProjeto varchar(80), @funcionario varchar(80)--, @funcionario2 varchar(80) --, @funum1 int, @funum2 int

DECLARE lista_cursor SCROLL CURSOR FOR
 SELECT pr.Nome_Projeto, em.Nome_Empregado--, em.Nome_Empregado     
 FROM TB_Projeto pr cross join TB_Empregado em cross join TB_Empregado_Projeto ep 
OPEN lista_cursor;

FETCH NEXT FROM lista_cursor
INTO @nomeProjeto, @funcionario--1 , @funcionario2

PRINT 
'Projeto: ' + @nomeProjeto + char(13) + 
'		Empregado que trabalhou 1: ' + @funcionario + char(13) + 
'		Empregado que trabalhou 2: ' + @funcionario;

WHILE @@FETCH_STATUS = 0
BEGIN 

FETCH NEXT FROM lista_cursor
INTO @nomeProjeto, @funcionario--1, @funcionario2

PRINT 
'Projeto: ' + @nomeProjeto + char(13) + 
'		Empregado que trabalhou 1: ' + @funcionario + char(13) + 
'		Empregado que trabalhou 2: ' + @funcionario;

END

CLOSE lista_cursor
DEALLOCATE lista_cursor 





--IF @funcionario1 = null 
--PRINT 
--'Projeto: ' + @nomeProjeto + 
--'\n funcionario1: ' + '<f1-vazio>' + 
--'\n funcionario2: ' +'<f2-vazio>';

--IF @funcionario2 = null 

--PRINT 
--'Projeto: ' + @nomeProjeto + 
--'\n funcionario1: ' + @funcionario1 + 
--'\n funcionario2: ' +'<f2-vazio>';

--ELSE

--SELECT TOP (@funcionario1) CPF_Empregado FROM TB_Empregado
--SELECT TOP 2 (@funcionario2) CPF_Empregado FROM TB_Empregado


 --WHERE pr.Numero_Projeto = @nomeProjeto AND em.Nome_Empregado = @funcionario--em.RG_Empregado IN (SELECT TOP (@funum1) CPF_Empregado FROM TB_Empregado ) AND em.RG_Empregado IN (SELECT TOP 2 (@funum2) CPF_Empregado FROM TB_Empregado ) 


 --SELECT TOP 1 em.Nome_Empregado
 --FROM  TB_Empregado em

 --select TOP 2 em.Nome_Empregado
 --FROM TB_Empregado em

 --ORDER BY Nome_Projeto DESC;
