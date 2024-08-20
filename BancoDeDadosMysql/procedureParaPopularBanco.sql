DELIMITER $$
DROP PROCEDURE IF EXISTS popularTabela;
$$
CREATE PROCEDURE popularTabela(quantasLinhas INT)
 BEGIN
 
 -- Declaracão de variavel
   DECLARE contador INT DEFAULT 0;
   DECLARE idEndereco BIGINT DEFAULT 0;
   DECLARE idInst	BIGINT DEFAULT 0;
   DECLARE novoId BIGINT DEFAULT 0;
-- Loop de um até 
     esteELoop:LOOP 
	   SET contador = contador + 1;
       SET novoId = 3 * contador + now();
       
       -- da aqui voce coloca o query
	     INSERT INTO tb_Instituicao (Nome,Email)
                              VALUES(concat('larissa',contador),concat('Teste@test',novoId));
                              
         SET idInst = last_insert_id();
         
         INSERT INTO tb_Endereco (Tipo,Lougradouro,Numero,Cidade,Bairro,Estado, CP)
						   VALUES('Rua','Herculano',contador,'Poa','Alvorada','São Paulo',08550130);
                           
         SET idEndereco = last_insert_id();   
         
         INSERT INTO tb_Ender_Insti (Id_Inst, Id_Lougra)
							  VALUES(idInst,idEndereco);
       -- até aqui
       
       -- Finaliza o loop
       IF (contador > quantasLinhas) THEN
          LEAVE esteELoop;
	   END IF;
 
     END LOOP esteELoop;

 END $$
 
