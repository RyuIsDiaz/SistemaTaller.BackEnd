CREATE FUNCTION FN_VehiculosCliente_VerificaExistenciaPorPlacaVehiculo ( 
	@Placa VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteVehiculoCliente BIT;
	
	SET @ExisteVehiculoCliente = (SELECT count(Placa) FROM VehiculosCliente WHERE Placa = @Placa)
	 
    RETURN @ExisteVehiculoCliente
END;