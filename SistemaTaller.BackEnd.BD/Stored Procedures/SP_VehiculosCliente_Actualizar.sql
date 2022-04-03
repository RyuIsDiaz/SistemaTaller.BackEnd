CREATE PROCEDURE SP_VehiculosCliente_Actualizar
	@Placa VARCHAR(10),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteVehiculosCliente BIT
		
		SET @ExisteVehiculosCliente = dbo.FN_VehiculosCliente_VerificaExistenciaPorPlacaVehiculo(@Placa)
		
		IF(@ExisteVehiculosCliente = 1)
			BEGIN
				UPDATE VehiculosCliente 
				SET
					Activo = @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Placa = @Placa

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'VehiculoCliente: '+	@Placa	+' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor


		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el VehiculoCliente '+	@Placa + '. Número de Error: ' + @NumeroDeError	
	END CATCH