---------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_ErroresBD_Insertar
	@CreadoPor VARCHAR(60)
	AS 
	BEGIN
		INSERT INTO ErroresBD (NumeroDeError, MensajeDelError, LineaDelError, CreadoPor)
		VALUES (ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE(), @CreadoPor)

		RETURN @@IDENTITY
	END