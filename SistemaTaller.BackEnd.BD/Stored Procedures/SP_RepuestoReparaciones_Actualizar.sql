CREATE PROCEDURE SP_RepuestoReparaciones_Actualizar
    @IdReparaciones INT,
	@CodigoRepuestos VARCHAR(25),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteRepuestoReparaciones BIT
		
		SET @ExisteRepuestoReparaciones = dbo.FN_RepuestoReparaciones_VerificaExistenciaPorIdReparaciones(@IdReparaciones)
		
		IF(@ExisteRepuestoReparaciones = 1)
			BEGIN
				UPDATE RepuestoReparaciones
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
				SET @DetalleError = 'RepuestoReparación: '+ @IdReparaciones +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION

			DECLARE @NumeroDeError INT 
			EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Repuesto '+	@IdReparaciones
		
	END CATCH