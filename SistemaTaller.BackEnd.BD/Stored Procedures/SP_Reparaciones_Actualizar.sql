CREATE PROCEDURE SP_Reparaciones_Actualizar
@IdReparaciones INT,
	@FechasIngreso DATE,
	@FechasSalida DATE,
	@PlacasVehiculos VARCHAR(10),
	@IdMecanicos VARCHAR(20),
	@DiagnosticosReparaciones VARCHAR(100),
	@IdEstadosReparacion INT,
	@MontosDeObra DECIMAL(18,3), 
	@MontosRepuestos DECIMAL(18,3),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteReparaciones BIT
		
		SET @ExisteReparaciones = dbo.FN_Reparaciones_VerificaExistenciaPorIdReparaciones(@IdReparaciones)
		
		IF(@ExisteReparaciones = 1)
			BEGIN
				UPDATE Reparaciones
				SET
					
					Activo= @Activo,
					FechaModificacion = GETDATE(),
					ModificadoPor = @ModificadoPor
				WHERE 
					IdReparaciones = @IdReparaciones

				SET @ExisteError = 0
			END
		ELSE
			BEGIN
				SET @ExisteError = 1
				SET @DetalleError = 'Reparación: '+ @IdReparaciones +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION

			DECLARE @NumeroDeError INT 
			EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando la Reparación '+	@IdReparaciones
		
		END CATCH