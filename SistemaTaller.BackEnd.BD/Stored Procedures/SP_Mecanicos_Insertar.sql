------SPs Mecanicos------

CREATE PROCEDURE SP_Mecanicos_Insertar
	@Identificaciones VARCHAR(20),
	@Nombre VARCHAR(20),
	@Apellidos VARCHAR(30),
	@Telefono VARCHAR(15),
	@Email VARCHAR(30),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Mecanicos(Identificaciones, Nombre, Apellidos,Telefono,Email, CreadoPor)
			VALUES(@Identificaciones, @Nombre, @Apellidos,@Telefono,@Email, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Mecanico'		
	END CATCH