USE RH_UPPER_6319041;
GO

----TABUADA
--ALTER PROCEDURE SP_TABUADA @VALOR INT AS
--	DECLARE @INICIO INT = 1;
--	WHILE @INICIO <= 10
--	BEGIN
--		SELECT @VALOR AS TABUADA, @INICIO AS MULTIPLICADOR , @VALOR * @INICIO AS 'RESULTADO MULTIPLICA��O'
--		SET @INICIO = @INICIO + 1;
--	END


EXEC SP_TABUADA 10