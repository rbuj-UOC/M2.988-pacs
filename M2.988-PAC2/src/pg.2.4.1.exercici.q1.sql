-- Quins aeroports hi ha a la ciutat de Londres?
SELECT name,
    iata,
    icao,
    country,
    city
FROM dbo.airports
WHERE city = 'London'