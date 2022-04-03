CREATE PROCEDURE SP_Talleres_Eliminar
	@Id VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteTaller BIT

			SET @ExisteTaller = dbo.FN_Talleres_VerificaExistenciaPorId(@Id)

			IF(@ExisteTaller = 1)
				BEGIN
					UPDATE Talleres 
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
					SET @DetalleError = 'Taller: '+	@Id	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Taller: '+	@Id	+ '. Número de Error: ' + @NumeroDeError

	END CATCH