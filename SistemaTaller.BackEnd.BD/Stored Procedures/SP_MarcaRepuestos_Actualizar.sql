CREATE PROCEDURE SP_MarcaRepuestos_Actualizar
	@Id INT,
	@Nombre VARCHAR(20),
    @Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteMarcaRepuesto BIT
		
		SET @ExisteMarcaRepuesto = dbo.FN_MarcaRepuestos_VerificaExistenciaPorId(@Id)
		
		IF(@ExisteMarcaRepuesto= 1)
			BEGIN
				UPDATE MarcaRepuestos
				SET
					
					Nombre = @Nombre,
		            Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					Id = @Id

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'MarcaRepuesto: '+ @Id +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando la Marca del Repuesto '+ @Id + '. Número de Error: ' + @NumeroDeError		
	END CATCH