CREATE PROCEDURE SP_Mecanicos_Desactivar
	@Identificaciones VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMecanico BIT

			SET @ExisteMecanico = dbo.FN_Mecanicos_VerificaExistenciaPorIdentificaciones(@Identificaciones)

			IF(@ExisteMecanico = 1)
				BEGIN
					UPDATE Mecanicos 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificaciones = @Identificaciones

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Mecanico: '+	@Identificaciones	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Mecanico: '+	@Identificaciones	+ '. Número de Error: ' + @NumeroDeError

	END CATCH