CREATE FUNCTION FN_RepuestoReparaciones_SeleccionarPorIdReparaciones(
	@IdReparaciones INT
) 
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_RepuestoReparaciones_SeleccionarTodos AS RepuestoReparaciones
		WHERE 
			RepuestoReparaciones.IdReparaciones = @IdReparaciones