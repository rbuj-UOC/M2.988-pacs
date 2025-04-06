-- Llistar l'id, el nom i la ciutat dels aeroports espanyols
SELECT id,
	name,
	city
FROM dbo.airports
WHERE country = 'Spain'