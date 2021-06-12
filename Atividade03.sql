DECLARE @vend_id INT;
DECLARE  cursor1 CURSOR FOR SELECT vend_id FROM vendors;
OPEN cursor1;
FETCH NEXT FROM cursor1 INTO @vend_id;
WHILE @@FETCH_STATUS = 0
BEGIN 	   
	  FETCH NEXT FROM cursor1 INTO @vend_id;
	  select  @vend_id as [Vendedor] , contagem as [Produtos Vendidos] from contar_produtos_vendidos(@vend_id)
END;
CLOSE cursor1;
DEALLOCATE cursor1;






