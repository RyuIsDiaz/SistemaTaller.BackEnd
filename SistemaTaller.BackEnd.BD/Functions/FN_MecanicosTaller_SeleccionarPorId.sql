CREATE FUNCTION FN_MecanicosTaller_SeleccionarPorId(
	@IdMecanicos VARCHAR(20) 
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MecanicosTaller_SeleccionarTodos AS MecanicosTaller
		WHERE 
			MecanicosTaller.IdMecanicos = @IdMecanicos