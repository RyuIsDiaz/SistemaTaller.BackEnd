CREATE FUNCTION FN_Vehiculo_VerificaExistenciaPorPlaca ( 
	@Placa VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteVehiculo BIT;
	
	SET @ExisteVehiculo = (SELECT count(Placa) FROM Vehiculos WHERE Placa = @Placa)
	 
    RETURN @ExisteVehiculo
END;