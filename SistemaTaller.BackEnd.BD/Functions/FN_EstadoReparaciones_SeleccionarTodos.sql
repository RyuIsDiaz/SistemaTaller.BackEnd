CREATE FUNCTION FN_EstadoReparaciones_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EstadoReparaciones_SeleccionarTodos