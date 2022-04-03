CREATE FUNCTION FN_Reparaciones_SeleccionarPorIdReparaciones(
	@IdReparaciones INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Reparaciones_SeleccionarTodos AS Reparaciones
		WHERE 
			Reparaciones.IdReparaciones = @IdReparaciones