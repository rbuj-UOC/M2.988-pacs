-- Visualitzar els països amb una longitud de nom més gran que 25 caràcters.

SELECT *
	FROM dbo.countries
	WHERE LEN(name) > 25;