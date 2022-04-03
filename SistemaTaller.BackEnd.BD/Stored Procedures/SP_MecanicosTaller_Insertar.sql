------SP's de la Tabla MecanicosTaller

CREATE PROCEDURE SP_MecanicosTaller_Insertar
	@IdMecanicos VARCHAR(20),
	@IdTalleres INT,
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO MecanicosTaller(IdMecanicos, IdTalleres, CreadoPor)
			VALUES(@IdMecanicos, @IdTalleres, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Vehiculo'+	@IdMecanicos+ '. Número de Error: ' + @NumeroDeError		
	END CATCH