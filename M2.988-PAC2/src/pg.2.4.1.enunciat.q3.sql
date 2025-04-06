-- Llistar les aerolínies que contenen la paraula "Iberia"
SELECT *
FROM dbo.airlines
WHERE name like '%Iberia%'