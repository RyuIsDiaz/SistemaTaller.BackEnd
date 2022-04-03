CREATE FUNCTION FN_Repuestos_SeleccionarPorCodigoRepuesto(
	@CodigoRepuesto VARCHAR (25)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Repuestos_SeleccionarTodos AS Repuestos
		WHERE 
			Repuestos.CodigoRepuesto = @CodigoRepuesto