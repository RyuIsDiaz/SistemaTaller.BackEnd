CREATE FUNCTION FN_EstadoReparaciones_SeleccionarPorId(
	@Id INT
) 
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EstadoReparaciones_SeleccionarTodos AS EstadoReparaciones
		WHERE 
			EstadoReparaciones.Id = @Id