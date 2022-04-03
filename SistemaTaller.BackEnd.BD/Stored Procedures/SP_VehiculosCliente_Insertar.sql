------SP's de la Tabla VehiculosCliente


CREATE PROCEDURE SP_VehiculosCliente_Insertar
	@IdentificacionCliente VARCHAR(20),
	@Placa VARCHAR(10),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION

			INSERT INTO VehiculosCliente(IdentificacionCliente, Placa, CreadoPor)
			VALUES(@IdentificacionCliente, @Placa, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Vehiculo de cliente ' +	@Placa+ '. Número de Error: ' + @NumeroDeError		
	END CATCH