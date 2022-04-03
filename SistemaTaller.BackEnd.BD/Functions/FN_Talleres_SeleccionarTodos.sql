CREATE FUNCTION FN_Talleres_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Talleres_SeleccionarTodos