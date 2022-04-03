---SP's Tabla Repuestos

CREATE PROCEDURE SP_Repuestos_Insertar
	@CodigoRepuesto VARCHAR(25),
	@Nombre VARCHAR(20),
	@IdMarca INT,
	@Precio DECIMAL(18,3),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Repuestos(CodigoRepuesto,Nombre,IdMarca,Precio, CreadoPor)
			VALUES(@CodigoRepuesto,@Nombre,@IdMarca,@Precio,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Repuesto'		
	END CATCH