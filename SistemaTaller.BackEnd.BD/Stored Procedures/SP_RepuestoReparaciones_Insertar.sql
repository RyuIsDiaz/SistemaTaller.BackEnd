CREATE PROCEDURE SP_RepuestoReparaciones_Insertar
@IdReparaciones INT,
	@CodigoRepuestos VARCHAR(25),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO RepuestoReparaciones(IdReparaciones, CodigoRepuestos, CreadoPor)
			VALUES(@IdReparaciones, @CodigoRepuestos, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

	DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un RepuestoReparación: ' + @NumeroDeError
	END CATCH