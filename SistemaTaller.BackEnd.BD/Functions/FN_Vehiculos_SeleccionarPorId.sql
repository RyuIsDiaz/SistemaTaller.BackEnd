CREATE FUNCTION FN_Vehiculos_SeleccionarPorId(
	@Placa VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Vehiculos_SeleccionarTodos AS Vehiculos
		WHERE 
			Vehiculos.Placa = @Placa