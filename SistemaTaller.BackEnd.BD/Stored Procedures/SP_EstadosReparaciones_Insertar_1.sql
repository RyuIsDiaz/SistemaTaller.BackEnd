CREATE PROCEDURE SP_EstadosReparaciones_Insertar
@IdReparaciones INT,
	@FechasIngreso DATE,
	@FechasSalida DATE,
	@PlacasVehiculos VARCHAR(10),
	@IdMecanicos VARCHAR(20),
	@DiagnosticosReparaciones VARCHAR(100),
	@IdEstadosReparacion INT,
	@MontosDeObra DECIMAL(18,3), 
	@MontosRepuestos DECIMAL(18,3),
	@CreadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Reparaciones(IdReparaciones, FechasIngreso, FechasSalida, PlacasVehiculos,
			IdMecanicos, DiagnosticosReparaciones, IdEstadosReparacion, MontosDeObra, MontosRepuestos, CreadoPor)
			VALUES(@IdReparaciones, @FechasIngreso, @FechasSalida, @PlacasVehiculos, @IdMecanicos,
		@DiagnosticosReparaciones, @IdEstadosReparacion, @MontosDeObra, @MontosRepuestos, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION

	DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando una Reparación: ' + @NumeroDeError
	END CATCH