CREATE PROCEDURE SP_talleres_Actualizar
	@Id INT,
	@Nombre VARCHAR(45),
	@Telefono VARCHAR(15),
	@Canton VARCHAR(15),
	@Direccion VARCHAR(80),
	@Email VARCHAR(30),
    @Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteTaller BIT
		
		SET @ExisteTaller = dbo.FN_Talleres_VerificaExistenciaPorId(@Id)
		
		IF(@ExisteTaller = 1)
			BEGIN
				UPDATE Talleres
				SET
					
					Nombre = @Nombre,
					Telefono= @Telefono,
					Canton=@Canton,
					Direccion=@Direccion,
					Email = @Email,
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
				SET @DetalleError = 'Taller: '+ @Id +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Taller '+ @Id + '. Número de Error: ' + @NumeroDeError		
	END CATCH