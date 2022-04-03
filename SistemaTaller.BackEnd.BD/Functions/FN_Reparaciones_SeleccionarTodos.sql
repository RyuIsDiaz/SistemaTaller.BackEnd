CREATE FUNCTION FN_Reparaciones_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Reparaciones_SeleccionarTodos