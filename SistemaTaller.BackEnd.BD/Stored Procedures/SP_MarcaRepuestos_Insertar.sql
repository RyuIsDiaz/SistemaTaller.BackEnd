----SP's Tabla MarcaRepuestos

CREATE PROCEDURE SP_MarcaRepuestos_Insertar
	@Id INT,
	@Nombre VARCHAR(20),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO MarcaRepuestos(Id, Nombre,CreadoPor)
			VALUES(@Id, @Nombre, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando una Marca de Repuesto'		
	END CATCH