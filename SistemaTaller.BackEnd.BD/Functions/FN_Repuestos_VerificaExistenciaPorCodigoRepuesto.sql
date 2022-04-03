CREATE FUNCTION FN_Repuestos_VerificaExistenciaPorCodigoRepuesto ( 
	@CodigoRepuesto VARCHAR(25))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteTaller BIT;
	
	SET @ExisteTaller = (SELECT count(@CodigoRepuesto) FROM Repuestos WHERE CodigoRepuesto = @CodigoRepuesto)
	 
    RETURN @ExisteTaller
END;