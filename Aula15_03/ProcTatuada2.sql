
----TABUADA 2.0
ALTER PROCEDURE SP_TABUADA2 @INTERVALO INT AS /*PROC PASSANDO UM INTERVALO ASSIM CRIANDO VARIAS TATUADAS AT� ATINGIT A TABUADA DO N�MERO DIGITADO*/
	DECLARE @CONTADOR INT = 1, @CONTROLE INT = 1;
	WHILE @CONTROLE <= @INTERVALO
	BEGIN
		WHILE @CONTADOR <= 10 
		BEGIN
			SELECT @CONTADOR * @CONTROLE;
			SET @CONTADOR = @CONTADOR + 1;
		END
		SET @CONTROLE = @CONTROLE + 1;
		SET @CONTADOR = 1;
	END
	





EXEC SP_TABUADA2 3