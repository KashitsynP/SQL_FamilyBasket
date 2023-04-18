USE [FamilyBasket]
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetSKUPrice]    Script Date: 16.04.2023 17:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[udf_GetSKUPrice]
(@ID_SKU AS INT)
RETURNS DECIMAL(18, 2) AS
	BEGIN 
		DECLARE @Price DECIMAL(18, 2)
		
		SELECT @Price = SUM(Value) / SUM(Quantity)
		FROM dbo.Basket
		WHERE ID_SKU = @ID_SKU
		RETURN @Price
	END