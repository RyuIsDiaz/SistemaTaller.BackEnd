CREATE FUNCTION FN_RepuestoReparaciones_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_RepuestoReparaciones_SeleccionarTodos