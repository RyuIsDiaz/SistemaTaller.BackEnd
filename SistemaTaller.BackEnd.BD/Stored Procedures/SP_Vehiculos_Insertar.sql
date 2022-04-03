------SP's de la Tabla Vehiculos

CREATE PROCEDURE SP_Vehiculos_Insertar
	@Placa VARCHAR(10),
	@IdMarca INT,
	@Modelo INT,
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION

			INSERT INTO Vehiculos(Placa,IdMarca,Modelo,CreadoPor)
			VALUES(@Placa,@IdMarca,@Modelo,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Vehiculo'+	@Placa+ '. Número de Error: ' + @NumeroDeError		
	END CATCH