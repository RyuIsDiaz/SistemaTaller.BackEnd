CREATE FUNCTION FN_MarcaVehiculos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MarcaVehiculos_SeleccionarTodos