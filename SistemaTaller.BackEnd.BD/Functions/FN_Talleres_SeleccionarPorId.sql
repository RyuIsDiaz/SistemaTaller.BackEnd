CREATE FUNCTION FN_Talleres_SeleccionarPorId(
	@Id INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Talleres_SeleccionarTodos AS Talleres
		WHERE 
			Talleres.Id = @Id