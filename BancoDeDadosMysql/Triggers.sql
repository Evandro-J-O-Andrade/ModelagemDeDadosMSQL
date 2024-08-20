DELIMITER $$
## CRIACAO DE TRIGGERS
$$

USE newwav_correnteDoBem;

$$

DROP TRIGGER IF EXISTS tg_TodasAlteracoesInstituicao;

$$

$$

CREATE TRIGGER tg_TodasAlteracoesInstituicao AFTER UPDATE  ON tb_Instituicao 
	FOR EACH ROW 
      BEGIN 
	 INSERT INTO tb_ModInstituicao (Id_ModInst,Nome,Email,Usuario_At)
							 VALUES(old.Id_Inst, old.Nome, old.Email,USER(),now());
END

$$

DROP TRIGGER IF EXISTS tg_AdSalvaTodasDeletadaInstituicao;

$$

CREATE TRIGGER tg_AdSalvaTodasDeletadaInstituicao AFTER DELETE  ON tb_Instituicao 
	FOR EACH ROW 
      BEGIN 
	 INSERT INTO tb_ModInstituicao (Id_Inst, Nome,Email,Usuario_At)
							 VALUES(old.Id_Inst, old.Nome, old.Email,USER(),now());	  
END 

$$

$$

DROP TRIGGER IF EXISTS tg_AfTodasAlteracoesDoador;

$$

$$

CREATE TRIGGER tg_AfTodasAlteracoesDoador AFTER UPDATE  ON tb_Doador
	FOR EACH ROW
	  BEGIN
	 INSERT INTO tb_ModDoador (Id_ModDoador,Nome, Usuario_At, Email, Senha, Data_MdDoador)
					    VALUES(old.Id_Doador, old.Nome,user(), old.Email, old.Senha,  now());
END

$$


$$

DROP TRIGGER IF EXISTS tg_AdSalvaTodasDeletadaDoador;

$$


$$
CREATE TRIGGER tg_AdSalvaTodasDeletadaDoador AFTER DELETE  ON tb_Doador 
	FOR EACH ROW 
      BEGIN 
	 INSERT INTO tb_ModDoador (Id_ModDoador,Nome, Usuario_At, Email, Senha, Data_MdDoador)
						VALUES(old.Id_Doador, old.Nome, user(), old.Email, old.Senha,  now());
END 
$$

DELIMITER ;