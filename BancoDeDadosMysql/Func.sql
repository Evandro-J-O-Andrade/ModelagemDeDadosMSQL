DELIMITER $$
## Criando as Funçoes 
$$
DROP FUNCTION IF EXISTS fn_VerificarUsuario;
$$
CREATE FUNCTION  fn_VerificarUsuario (Email varchar(150),Senha varchar (250)) RETURNS BOOLEAN
BEGIN
 if (select 1 from tb_Doador as td where td.Email = Email AND td.Senha =Senha) THEN
 return true;
 else  return false;
 END IF ;
 END ;
 
$$

DELIMITER ;


