CREATE PROC dbo.usp_MakeFamilyPurhase
	@FamilySurName VARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM dbo.Family WHERE SurName = @FamilySurName)
	BEGIN
		PRINT('Такой семьи нет');
		RETURN;
	END;

	UPDATE dbo.Family
	SET BudgetValue = BudgetValue - (SELECT [Value] FROM dbo.Basket WHERE dbo.Family.SurName = @FamilySurName)
	WHERE dbo.Family.SurName = @FamilySurName;
END;

