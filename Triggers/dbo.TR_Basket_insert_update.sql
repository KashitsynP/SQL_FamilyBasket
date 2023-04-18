CREATE TRIGGER TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT ID_SKU, COUNT(*) AS CountSKU
        FROM inserted
        GROUP BY ID_SKU
        HAVING COUNT(*) >= 2
    )
    BEGIN
        UPDATE B
        SET DiscountValue = B.Value * 0.05
        FROM dbo.Basket AS B
        JOIN (
            SELECT ID_SKU, COUNT(*) AS CountSKU
            FROM inserted
            GROUP BY ID_SKU
            HAVING COUNT(*) >= 2
        ) AS i ON B.ID_SKU = i.ID_SKU
    END
    ELSE
    BEGIN
        UPDATE B
        SET DiscountValue = 0
        FROM dbo.Basket AS B
        JOIN inserted AS i ON B.ID = i.ID
    END
END