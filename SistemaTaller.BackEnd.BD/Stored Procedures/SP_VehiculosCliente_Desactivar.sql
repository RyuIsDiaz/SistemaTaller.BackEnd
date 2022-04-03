CREATE PROCEDURE SP_VehiculosCliente_Desactivar
	@Placa VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteVehiculoCliente BIT

			SET @ExisteVehiculoCliente = dbo.FN_VehiculosCliente_VerificaExistenciaPorPlacaVehiculo(@Placa)

			IF(@ExisteVehiculoCliente = 1)
				BEGIN
					UPDATE VehiculosCliente 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Placa = @Placa

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Vehiculos de Cliente: '+	@Placa	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Vehiculo del Cliente: '+	@Placa	+ '. Número de Error: ' + @NumeroDeError

	END CATCH