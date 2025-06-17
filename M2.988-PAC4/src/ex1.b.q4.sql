SELECT source_airport.country AS country,
    COUNT(*) AS total_flights
FROM dbo.fact_flights flights
    JOIN dbo.dim_airports source_airport ON flights.fk_source_airport = source_airport.pk_airport
    JOIN dbo.dim_airports destination_airport ON flights.fk_destination_airport = destination_airport.pk_airport
WHERE source_airport.country = destination_airport.country
    AND source_airport.continent = 'Europe'
    AND source_airport.timezone = (
        SELECT timezone
        FROM dbo.dim_airports
        WHERE tz = 'Europe/Madrid'
            AND timezone IS NOT NULL
        LIMIT 1
    )
GROUP BY source_airport.country
ORDER BY total_flights DESC;