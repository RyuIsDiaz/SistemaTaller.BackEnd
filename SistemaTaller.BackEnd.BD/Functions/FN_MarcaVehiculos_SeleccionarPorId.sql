CREATE FUNCTION FN_MarcaVehiculos_SeleccionarPorId(
	@Id INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MarcaVehiculos_SeleccionarTodos AS MarcaVehiculos
		WHERE 
			MarcaVehiculos.Id = @Id