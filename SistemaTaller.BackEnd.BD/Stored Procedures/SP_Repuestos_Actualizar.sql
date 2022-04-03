CREATE PROCEDURE SP_Repuestos_Actualizar
    @CodigoRepuesto VARCHAR(25),
	@Nombre VARCHAR(20) ,
	@IdMarca INT,
	@Precio DECIMAL(18,3),
    @Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteRepuesto BIT
		
		SET @ExisteRepuesto = dbo.FN_Repuestos_VerificaExistenciaPorCodigoRepuesto(@CodigoRepuesto)
		
		IF(@ExisteRepuesto = 1)
			BEGIN
				UPDATE Repuestos
				SET
					
					Nombre = @Nombre,
					IdMarca= @IdMarca,
	                Precio = @Precio,
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					CodigoRepuesto= @CodigoRepuesto

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Repuesto: '+ @CodigoRepuesto+' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Repuesto '+ @CodigoRepuesto+ '. Número de Error: ' + @NumeroDeError		
	END CATCH