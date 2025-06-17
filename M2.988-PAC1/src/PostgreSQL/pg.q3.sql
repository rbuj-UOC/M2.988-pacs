-- Realitzar una consulta per comptabilitzar els registres de la taula airlines
-- que estiguin actius

SELECT COUNT(1) AS reg
	FROM dbo.airlines
	WHERE active = TRUE;