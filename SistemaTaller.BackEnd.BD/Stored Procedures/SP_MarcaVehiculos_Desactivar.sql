CREATE PROCEDURE SP_MarcaVehiculos_Desactivar
	@Id INT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMarcaVehiculo BIT

			SET @ExisteMarcaVehiculo = dbo.FN_MarcaVehiculos_VerificaExistenciaPorId(@Id)
			
			IF(@ExisteMarcaVehiculo = 1)
				BEGIN
					UPDATE MarcaVehiculos
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Id = @Id

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Marca Vehiculo: '+	@Id+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar la marca del vehiculo: '+	@Id	+ '. Número de Error: ' + @NumeroDeError

	END CATCH