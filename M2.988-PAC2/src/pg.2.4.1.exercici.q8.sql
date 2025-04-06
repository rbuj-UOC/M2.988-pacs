-- Mostrar els països que tenen més de 100 aeroports, ordenats segons
-- nombre d'aeroports, de major a menor
SELECT country,
    COUNT(*) AS num_airports
FROM dbo.airports
GROUP BY country
HAVING COUNT(*) > 100
ORDER BY num_airports DESC;