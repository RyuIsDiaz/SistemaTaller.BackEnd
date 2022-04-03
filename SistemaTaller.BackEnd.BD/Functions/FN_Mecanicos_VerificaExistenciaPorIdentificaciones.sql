CREATE FUNCTION FN_Mecanicos_VerificaExistenciaPorIdentificaciones (
	@Identificaciones VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMecanico BIT;
	
	SET @ExisteMecanico = (SELECT count(Identificaciones) FROM Mecanicos WHERE Identificaciones = @Identificaciones)
	 
    RETURN @ExisteMecanico
END;