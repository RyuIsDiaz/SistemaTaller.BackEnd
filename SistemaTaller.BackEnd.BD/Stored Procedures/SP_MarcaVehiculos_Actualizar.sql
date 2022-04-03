CREATE PROCEDURE SP_MarcaVehiculos_Actualizar
	@Id INT,
	@Nombre VARCHAR(20),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteMarcaVehiculo BIT
		
		SET @ExisteMarcaVehiculo = dbo.FN_MarcaVehiculos_VerificaExistenciaPorId (@Id)
		
		IF(@ExisteMarcaVehiculo= 1)
			BEGIN
				UPDATE MarcaVehiculos
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
				SET @DetalleError = 'Marca Vehiculos: '+ @Id +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION

	    DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando la marca de vehiculo '+	@Id+'. Número de Error: ' + @NumeroDeError

	END CATCH