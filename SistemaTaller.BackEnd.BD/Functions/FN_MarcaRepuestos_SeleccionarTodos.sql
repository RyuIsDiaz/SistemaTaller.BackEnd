CREATE FUNCTION FN_MarcaRepuestos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MarcaRepuestos_SeleccionarTodos