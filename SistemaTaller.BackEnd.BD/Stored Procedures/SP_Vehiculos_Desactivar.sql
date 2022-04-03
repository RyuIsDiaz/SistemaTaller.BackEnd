CREATE PROCEDURE SP_Vehiculos_Desactivar
	@Placa VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteVehiculo BIT

			SET @ExisteVehiculo = dbo.FN_Vehiculo_VerificaExistenciaPorPlaca(@Placa)

			IF(@ExisteVehiculo = 1)
				BEGIN
					UPDATE Vehiculos 
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
					SET @DetalleError = 'Vehiculo: '+	@Placa	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Vehiculo: '+	@Placa	+ '. Número de Error: ' + @NumeroDeError

	END CATCH