CREATE PROCEDURE SP_MecanicosTaller_Actualizar
	@IdMecanicos VARCHAR(20),
	@IdTalleres INT,
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteMecanicosTaller BIT
		
		SET @ExisteMecanicosTaller = dbo.FN_MecanicosTaller_VerificaExistenciaPorIdMecanicos(@IdMecanicos)
		
		IF(@ExisteMecanicosTaller = 1)
			BEGIN
				UPDATE MecanicosTaller
				SET
					IdTalleres = @IdTalleres,
					Activo = @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					IdMecanicos = @IdMecanicos

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'MecanicosTaller: '+	@IdMecanicos	+' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el MecanicosTaller '+	@IdMecanicos+ '. Número de Error: ' + @NumeroDeError
	END CATCH