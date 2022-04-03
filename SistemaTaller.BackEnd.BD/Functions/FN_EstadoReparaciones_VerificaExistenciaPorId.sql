CREATE FUNCTION FN_EstadoReparaciones_VerificaExistenciaPorId ( 
	@Id INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteEstadoReparaciones BIT;
	
	SET @ExisteEstadoReparaciones = (SELECT count(Id) FROM EstadoReparaciones WHERE Id = @Id)
	 
    RETURN @ExisteEstadoReparaciones
END;