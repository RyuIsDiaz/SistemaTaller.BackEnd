CREATE PROCEDURE SP_EstadosReparaciones_Actualizar
    @Id INT,
	@Estados VARCHAR(15),
	@Activo BIT,
	@ModificadoPor VARCHAR(20),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY	
	BEGIN TRANSACTION
		DECLARE @ExisteEstadoReparaciones BIT
		
		SET @ExisteEstadoReparaciones = dbo.FN_EstadoReparaciones_VerificaExistenciaPorId(@Id)
		
		IF(@ExisteEstadoReparaciones = 1)
			BEGIN
				UPDATE EstadoReparaciones
				SET
					
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
				SET @DetalleError = 'EstadoReparación: '+ @Id +' No Existe'
			END
			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION

			DECLARE @NumeroDeError INT 
			EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Cliente '+	@Id
		
	END CATCH