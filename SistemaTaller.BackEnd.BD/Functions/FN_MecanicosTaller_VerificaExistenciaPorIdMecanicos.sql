CREATE FUNCTION FN_MecanicosTaller_VerificaExistenciaPorIdMecanicos ( 
	@IdMecanicos VARCHAR(20))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMecanicosTaller BIT;
	
	SET @ExisteMecanicosTaller = (SELECT count(IdMecanicos) FROM MecanicosTaller WHERE IdMecanicos = @IdMecanicos)
	 
    RETURN @ExisteMecanicosTaller
END;