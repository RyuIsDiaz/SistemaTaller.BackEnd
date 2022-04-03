CREATE FUNCTION FN_Reparaciones_VerificaExistenciaPorIdReparaciones ( 
	@IdReparaciones INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteReparaciones BIT;
	
	SET @ExisteReparaciones = (SELECT count(IdReparaciones) FROM Reparaciones WHERE IdReparaciones = @IdReparaciones)
	 
    RETURN @ExisteReparaciones
END;