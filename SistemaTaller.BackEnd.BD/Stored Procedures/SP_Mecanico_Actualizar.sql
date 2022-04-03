CREATE PROCEDURE SP_Mecanico_Actualizar
	@Identificaciones VARCHAR(20),
	@Nombre VARCHAR(20),
	@Apellidos VARCHAR(30),
	@Telefono VARCHAR(15),
	@Email VARCHAR(30),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteMecanico BIT
		
		SET @ExisteMecanico = dbo.FN_Mecanicos_VerificaExistenciaPorIdentificaciones(@Identificaciones)
		
		IF(@ExisteMecanico = 1)
			BEGIN
				UPDATE Mecanicos
				SET
					
					Nombre = @Nombre,
					Apellidos=@Apellidos,
					Telefono= @Telefono,
					Email = @Email,
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Identificaciones = @Identificaciones

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Mecanicos: '+ @Identificaciones +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION

	    DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Mecanico '+	@Identificaciones+'. Número de Error: ' + @NumeroDeError

	END CATCH