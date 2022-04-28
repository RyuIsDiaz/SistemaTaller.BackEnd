CREATE PROCEDURE SP_EstadosReparaciones_Insertar
	@Id INT,
    @Estados VARCHAR (20),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO EstadoReparaciones(Id, Estados, CreadoPor)
			VALUES(@Id, @Estados, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

	DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Estado de reparacion. Número de Error: ' + CONVERT( VARCHAR, @NumeroDeError)
	END CATCH