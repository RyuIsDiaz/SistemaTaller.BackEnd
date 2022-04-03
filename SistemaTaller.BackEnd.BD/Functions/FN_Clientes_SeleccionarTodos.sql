CREATE FUNCTION FN_Clientes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Clientes_SeleccionarTodos