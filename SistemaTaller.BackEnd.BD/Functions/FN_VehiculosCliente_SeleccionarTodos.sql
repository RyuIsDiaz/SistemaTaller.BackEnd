CREATE FUNCTION FN_VehiculosCliente_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_VehiculosCliente_SeleccionarTodos