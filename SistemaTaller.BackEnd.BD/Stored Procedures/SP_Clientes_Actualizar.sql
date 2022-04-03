CREATE PROCEDURE SP_Clientes_Actualizar
	@Identificacion VARCHAR(20),
	@Nombre VARCHAR(20),
	@Apellidos VARCHAR(30),
	@Telefono VARCHAR(15),
	@Email VARCHAR(30),
	@Direccion VARCHAR(15),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteCliente BIT
		
		SET @ExisteCliente = dbo.FN_Clientes_VerificaExistenciaPorIdentificacion(@Identificacion)
		
		IF(@ExisteCliente = 1)
			BEGIN
				UPDATE Clientes
				SET
					
					Nombre = @Nombre,
					Apellidos=@Apellidos,
					Telefono= @Telefono,
					Email = @Email,
					Direccion=@Direccion,
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Identificacion = @Identificacion

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Cliente: '+ @Identificacion +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION

			DECLARE @NumeroDeError INT 
			EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Cliente '+	@Identificacion
		
	END CATCH