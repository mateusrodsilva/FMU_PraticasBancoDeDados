CREATE FUNCTION FN_SEXO (@SEXO VARCHAR(1))
RETURNS VARCHAR(10)
BEGIN
	DECLARE @SEXO_EXTENSO VARCHAR(10);
	
	IF @SEXO = 'F'
		BEGIN
			SET @SEXO_EXTENSO = 'FEMININO'
		END
	ELSE
		BEGIN
			SET @SEXO_EXTENSO = 'MASCULINO'
		END
RETURN @SEXO_EXTENSO;
END