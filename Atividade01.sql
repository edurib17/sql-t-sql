
CREATE or ALTER FUNCTION get_descont
(
@id_produto character(50), @quantidade int
) 
RETURNS @ResultTable TABLE
( 
id_produt character(100),
desconto float
) AS BEGIN
     IF @quantidade <= 3 
	 Begin
        INSERT INTO @ResultTable SELECT prod_id, (prod_price - (prod_price * 0.2))* @quantidade   from products WHERE prod_id = @id_produto;
     end
    IF @quantidade > 3  
	Begin
	   INSERT INTO @ResultTable SELECT  prod_id,  (prod_price - (prod_price * 0.5))* @quantidade  from products WHERE prod_id = @id_produto;
	   end
RETURN
END


/* consulta 
SELECT id_produt as [Nome Produto] , desconto as [Produto com desconto] FROM get_descont('ANV01',2)
select * from products
*/