CREATE PROCEDURE SP_MecanicosTaller_Desactivar
	@IdMecanicos VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMecanicosTaller BIT

			SET @ExisteMecanicosTaller = dbo.FN_MecanicosTaller_VerificaExistenciaPorIdMecanicos(@IdMecanicos)

			IF(@ExisteMecanicosTaller = 1)
				BEGIN
					UPDATE MecanicosTaller 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						IdMecanicos = @IdMecanicos

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Aula: '+	@IdMecanicos	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el MecanicoTaller: '+	@IdMecanicos	+ '. Número de Error: ' + @NumeroDeError

	END CATCH