CREATE PROCEDURE SP_Repuestos_Desactivar
	@CodigoRepuesto VARCHAR (25),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteRepuesto BIT

			SET @ExisteRepuesto = dbo.FN_Repuestos_VerificaExistenciaPorCodigoRepuesto(@CodigoRepuesto)

			IF(@ExisteRepuesto = 1)
				BEGIN
					UPDATE Repuestos
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoRepuesto = @CodigoRepuesto

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Repuesto: '+	@CodigoRepuesto	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Mecanico: '+	@CodigoRepuesto	+ '. Número de Error: ' + @NumeroDeError

	END CATCH