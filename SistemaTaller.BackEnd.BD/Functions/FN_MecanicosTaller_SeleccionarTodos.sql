CREATE FUNCTION FN_MecanicosTaller_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MecanicosTaller_SeleccionarTodos