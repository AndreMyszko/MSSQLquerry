select pe.cod, pe.documento, pe.telefone, pe.nome, pe.endedreco, pe.email, fu.cod_Pessoa, fu.salario, fu.data_Contratacao, fu.data_Demissao, fu.senha_funcionario
from pessoa as pe inner join funcionario as fu on fu.cod_Pessoa = pe.cod;
  
  /*insert into funcionario (cod_Pessoa, salario, data_Contratacao, senha_funcionario) VALUES (3, 20000, '2020-10-10', 30);*/
  
select * from funcionario;
select * from pessoa;

SELECT MAX(cod_Pessoa) as 'maior' from funcionario