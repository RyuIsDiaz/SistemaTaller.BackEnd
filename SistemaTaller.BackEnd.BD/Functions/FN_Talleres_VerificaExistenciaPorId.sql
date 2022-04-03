CREATE FUNCTION FN_Talleres_VerificaExistenciaPorId ( 
	@Id VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteTaller BIT;
	
	SET @ExisteTaller = (SELECT count(Id) FROM Talleres WHERE Id = @Id)
	 
    RETURN @ExisteTaller
END;