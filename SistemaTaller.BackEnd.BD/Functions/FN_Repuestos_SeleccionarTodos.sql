CREATE FUNCTION FN_Repuestos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Repuestos_SeleccionarTodos