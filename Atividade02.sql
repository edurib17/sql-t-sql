
CREATE  OR ALTER FUNCTION contar_produtos_vendidos(@id_vendedor int)
RETURNS @prod_vendidos TABLE
(contagem int) 
AS BEGIN
     INSERT INTO @prod_vendidos SELECT count(vend_id)  FROM products  WHERE vend_id = @id_vendedor;
	 RETURN
END;

/*
select *  from contar_produtos_vendidos('1003'); 