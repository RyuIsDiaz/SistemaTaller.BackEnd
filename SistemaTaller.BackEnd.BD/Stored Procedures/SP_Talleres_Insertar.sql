-----SP's Tabla Talleres

CREATE PROCEDURE SP_Talleres_Insertar
	@Id INT,
	@Nombre VARCHAR(45),
	@Telefono VARCHAR(15),
	@Canton VARCHAR(15),
	@Direccion VARCHAR(80),
	@Email VARCHAR(30),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Talleres(Id, Nombre,Telefono,Canton,Direccion, Email, CreadoPor)
			VALUES(@Id, @Nombre,@Telefono,@Canton,@Direccion, @Email, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Taller' + @NumeroDeError		
	END CATCH