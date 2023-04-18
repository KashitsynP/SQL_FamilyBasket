CREATE VIEW dbo.vw_SKUPrice
AS
SELECT
 *, dbo.udf_GetSKUPrice(SKU.id) AS ProductPrice
FROM dbo.SKU