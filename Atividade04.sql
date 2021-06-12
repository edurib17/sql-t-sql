CREATE OR ALTER PROCEDURE atualizarProduto @preco_produto float,@id_produto character(50)
AS
BEGIN
BEGIN TRANSACTION;
UPDATE products SET prod_price = @preco_produto WHERE prod_id = @id_produto;   
COMMIT;
END;
GO

EXEC atualizarProduto @preco_produto = 8.11, @id_produto = 'ANV01';