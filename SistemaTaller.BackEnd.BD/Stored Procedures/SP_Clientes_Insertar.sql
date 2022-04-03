--------SP's Tabla Clientes

CREATE PROCEDURE SP_Clientes_Insertar
	@Identificacion VARCHAR(20),
	@Nombre VARCHAR(20),
	@Apellidos VARCHAR(30),
	@Telefono VARCHAR(15),
	@Email VARCHAR(30),
	@Direccion VARCHAR(15),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Clientes(Identificacion, Nombre, Apellidos,Telefono,Email, Direccion, CreadoPor)
			VALUES(@Identificacion, @Nombre, @Apellidos,@Telefono,@Email, @Direccion, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

	DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Cliente: ' + @NumeroDeError
	END CATCH