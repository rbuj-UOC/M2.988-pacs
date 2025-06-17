-- Realitzar una consulta per previsualitzar els registres de la taula airlines que
-- pertanyin a Espanya.

SELECT *
	FROM dbo.airlines
	WHERE country = 'Spain';