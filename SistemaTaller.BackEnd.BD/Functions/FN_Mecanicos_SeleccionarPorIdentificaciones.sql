CREATE FUNCTION FN_Mecanicos_SeleccionarPorIdentificaciones(
	@Identificaciones VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Mecanicos_SeleccionarTodos AS Mecanicos
		WHERE 
			Mecanicos.Identificaciones = @Identificaciones