CREATE FUNCTION FN_MarcaVehiculos_VerificaExistenciaPorId ( 
	@Id INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMarcaVehiculo BIT;
	
	SET @ExisteMarcaVehiculo = (SELECT count(Id) FROM MarcaVehiculos WHERE Id = @Id)
	 
    RETURN @ExisteMarcaVehiculo
END;