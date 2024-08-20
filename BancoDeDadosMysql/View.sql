CREATE VIEW v_Instituicao_Endereco AS
SELECT i.Id_Inst AS 'ID', Nome, e.Tipo, e.Lougradouro, e.Numero, e.Cidade, e.Bairro, e.Estado,e.CP AS 'CEP'
  FROM tb_Instituicao i
 INNER JOIN tb_Ender_Insti ei ON ei.Id_Inst = i.Id_Inst
 INNER JOIN tb_Endereco e ON e.Id_Lougra = ei.Id_Lougra;
