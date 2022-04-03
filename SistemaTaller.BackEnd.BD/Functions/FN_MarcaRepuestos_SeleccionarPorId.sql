CREATE FUNCTION FN_MarcaRepuestos_SeleccionarPorId(
	@Id INT)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MarcaRepuestos_SeleccionarTodos AS MarcaRepuestos
		WHERE 
			MarcaRepuestos.Id = @Id