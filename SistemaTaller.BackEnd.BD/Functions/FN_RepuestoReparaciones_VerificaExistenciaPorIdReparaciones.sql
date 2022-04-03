CREATE FUNCTION FN_RepuestoReparaciones_VerificaExistenciaPorIdReparaciones ( 
	@IdReparaciones INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteRepuestoReparaciones BIT;
	
	SET @ExisteRepuestoReparaciones = (SELECT count(IdReparaciones) FROM RepuestoReparaciones WHERE IdReparaciones = @IdReparaciones)
	 
    RETURN @ExisteRepuestoReparaciones
END;