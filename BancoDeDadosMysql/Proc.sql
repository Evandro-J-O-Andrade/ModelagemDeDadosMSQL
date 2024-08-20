DELIMITER $$
## CRIACAO DE PROC
$$

USE newwav_correnteDoBem;

$$

DROP PROCEDURE IF EXISTS proc_InsereDoador;

$$

CREATE PROCEDURE proc_InsereDoador(IN Nome VARCHAR(150),IN Email VARCHAR(255),IN Senha VARCHAR(150))
  BEGIN
    IF((Nome != '' AND  !isnull(Nome)) AND (Email != '' AND !isnull(Email)) AND (Senha != '' AND !isnull(Senha)) ) THEN
      INSERT INTO tb_Doador(Nome,Email,Senha)
					 VALUES(Nome,Email,md5(Senha));
      SELECT 'Doação Cadastrada Com Sucesso!' as 'Mensagem Procedure proc_InsereDoador';
	 ELSE
      SELECT 'Verifique os Parâmetros' as 'Mensagem Procedure proc_InsereDoador';
    END IF;
  END;

$$

DROP PROCEDURE IF EXISTS proc_InsereProduto;

$$

CREATE PROCEDURE proc_InsereProduto(IN Nome VARCHAR(150), IN Quantidade INT,IN id_Doador INT)
  BEGIN
  
    IF((Nome != '' AND !isnull(Nome)) AND (Quantidade > 0) AND (id_Doador > 0)) THEN 
	    INSERT INTO tb_Produtos(Nome,Quantidade,id_Doador)
                         VALUES(Nome,Quantidade,id_Doador);
		SELECT 'Produto Cadastrado Com Sucesso!' AS 'Mensagem Procedure proc_InsereProduto';
      ELSE
        SELECT 'verifique os Parâmetros' AS 'Mensagem Procedure proc_InsereProduto';
	END IF;
    
  END ;
  
$$
 
DROP PROCEDURE IF EXISTS proc_InsereProdutoDoacao;

$$

CREATE PROCEDURE proc_InsereProdutoDoacao(IN Id_Produto INT, IN Id_Doacao INT)
  BEGIN
  
    IF ((Id_Produto > 0) AND (Id_Doacao > 0)) THEN
      INSERT INTO tb_Prod_Doacao(Id_Produto,Id_Doacao)
                         VALUES (Id_Produto,Id_Doacao);
	  SELECT 'Cadastro Efetuado Com Sucesso!' AS 'Mensagem proc_InsereProdutoDaocao';
	 ELSE
	  SELECT 'Verifique os Parâmetros !' AS 'Mensagem proc_InsereProdutoDaocao';
    END IF;
    
  END;
  
$$
	
DELIMITER ;