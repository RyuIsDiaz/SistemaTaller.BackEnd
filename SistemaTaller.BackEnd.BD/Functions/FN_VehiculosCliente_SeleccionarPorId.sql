CREATE FUNCTION FN_VehiculosCliente_SeleccionarPorId(
	@IdentificacionCliente VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_VehiculosCliente_SeleccionarTodos AS VehiculosCliente
		WHERE 
			VehiculosCliente.IdentificacionCliente = @IdentificacionCliente