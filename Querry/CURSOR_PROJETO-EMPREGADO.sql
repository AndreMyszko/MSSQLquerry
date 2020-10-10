/*
Aluno: André Luiz Branco Belem Myszko
RA: 2019102420
*/

--select * from TB_Projeto
--select * from TB_Empregado
--select * from TB_Empregado_Projeto

DECLARE @projeto varchar(40)
DECLARE @numprojeto int
DECLARE @empregado varchar(40)
DECLARE @numempregado int

DECLARE cr_projetoStatus CURSOR
	FOR SELECT Nome_Projeto, Numero_Projeto 
	FROM TB_Projeto

OPEN cr_projetoStatus
	FETCH NEXT FROM cr_projetoStatus
		INTO @projeto, @numprojeto

	WHILE @@FETCH_STATUS = 0
		BEGIN

			PRINT '----------------------------------------------'
			PRINT 'Projeto: ' + CONVERT(VARCHAR(4), @numprojeto) + ' - ' + @projeto 

			DECLARE cr_empregadoStatus Cursor
				FOR SELECT TOP 2 em.Nome_Empregado
				FROM TB_Empregado em, TB_Empregado_Projeto ep
				WHERE em.RG_Empregado = ep.RG_Empregado AND @numprojeto = ep.Numero_Projeto 

			OPEN cr_empregadoStatus
				FETCH NEXT FROM cr_empregadoStatus
					INTO @empregado
				WHILE @@FETCH_STATUS = 0
				BEGIN
						PRINT '		Epregado Envolvido: ' + @empregado

				FETCH NEXT FROM cr_empregadoStatus
					INTO @empregado

			END

			CLOSE cr_empregadoStatus
			DEALLOCATE cr_empregadoStatus		  

			SELECT @numempregado = COUNT(em.Nome_Empregado) 
			FROM TB_Empregado em, TB_Empregado_Projeto ep 
			WHERE em.RG_Empregado = ep.RG_Empregado AND @numprojeto = ep.Numero_Projeto 
				IF @numempregado = 0
					PRINT '		EMPREGADO VAZIO' + char(13)+ '		EMPREGADO VAZIO'

				IF @numempregado = 1
					PRINT '		EMPREGADO VAZIO'

			FETCH NEXT FROM cr_projetoStatus
				INTO @projeto, @numprojeto
 
		END

CLOSE cr_projetoStatus
DEALLOCATE cr_projetoStatus