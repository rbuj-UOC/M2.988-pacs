-- Obtenir el total d'aeroports que hi ha a Espanya i Portugal
SELECT COUNT(1) as total
FROM dbo.airports
WHERE country IN ('Spain', 'Portugal')