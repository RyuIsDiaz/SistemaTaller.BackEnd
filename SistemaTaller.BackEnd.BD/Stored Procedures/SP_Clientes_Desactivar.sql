CREATE PROCEDURE SP_Clientes_Desactivar
	@Identificacion VARCHAR(20),
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCliente BIT

			SET @ExisteCliente = dbo.FN_Clientes_VerificaExistenciaPorIdentificacion(@Identificacion)

			IF(@ExisteCliente = 1)
				BEGIN
					UPDATE Clientes 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Cliente: '+	@Identificacion	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Cliente: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError

	END CATCH