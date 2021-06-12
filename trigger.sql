/*
Em uma tabela audit_produtos registrar o id do produto, o usuário, quando a operação foi executada e qual a operação foi (armazenar a informação de deleção, 
update e insert). Criar a tabela audit_produtos no script. Usar uma TRIGGER para essa

*/

CREATE OR ALTER TRIGGER audit_pr
ON products
AFTER INSERT,UPDATE,DELETE
AS
BEGIN 
DECLARE @NEWprod_id NVARCHAR(10), @OLDprod_id NVARCHAR(10)
SELECT @OLDprod_id = prod_id FROM DELETED
SELECT @NEWprod_id = prod_id FROM INSERTED
IF EXISTS (SELECT * FROM inserted) and EXISTS (SELECT * FROM deleted)
BEGIN
INSERT INTO audit_prod VALUES (@NEWprod_id, user, CURRENT_TIMESTAMP,'U');
END
ELSE IF EXISTS(SELECT * FROM inserted)
BEGIN
INSERT INTO audit_prod VALUES (@NEWprod_id, user, CURRENT_TIMESTAMP,'I');
END
ElSE IF EXISTS(SELECT * FROM deleted)
BEGIN
INSERT INTO audit_prod  VALUES (@OLDprod_id, user, CURRENT_TIMESTAMP,'D');
END
END;


INSERT INTO products(prod_id, vend_id, prod_name, prod_price, prod_desc) VALUES('AN848',1001, 'FIFA 21', 300.99, 'Igual ao fifa 20');
UPDATE products SET prod_name = 'FIFA 20' WHERE prod_id = 'AN848'
DELETE FROM products WHERE prod_id = 'AN848';
SELECT * FROM audit_prod

