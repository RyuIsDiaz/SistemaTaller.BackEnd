CREATE FUNCTION FN_Mecanicos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Mecanicos_SeleccionarTodos