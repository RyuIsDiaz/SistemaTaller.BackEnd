CREATE FUNCTION FN_Vehiculos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Vehiculos_SeleccionarTodos