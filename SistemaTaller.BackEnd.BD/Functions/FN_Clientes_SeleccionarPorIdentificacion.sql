CREATE FUNCTION FN_Clientes_SeleccionarPorIdentificacion(
	@Identificacion VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Clientes_SeleccionarTodos AS Clientes
		WHERE 
			Clientes.Identificacion = @Identificacion