CREATE FUNCTION FN_MarcaRepuestos_VerificaExistenciaPorId ( 
	@Id INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMarcaRepuesto BIT;
	
	SET @ExisteMarcaRepuesto = (SELECT count(Id) FROM MarcaRepuestos WHERE Id = @Id)
	 
    RETURN @ExisteMarcaRepuesto
END;