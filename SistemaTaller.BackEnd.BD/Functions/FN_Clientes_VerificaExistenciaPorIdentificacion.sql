CREATE FUNCTION FN_Clientes_VerificaExistenciaPorIdentificacion ( 
	@Identificacion VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteCliente BIT;
	
	SET @ExisteCliente = (SELECT count(Identificacion) FROM Clientes WHERE Identificacion = @Identificacion)
	 
    RETURN @ExisteCliente
END;