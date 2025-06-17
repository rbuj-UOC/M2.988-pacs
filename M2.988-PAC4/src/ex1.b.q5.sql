WITH madrid_timezone AS (
    SELECT timezone
    FROM dbo.dim_airports
    WHERE tz = 'Europe/Madrid'
    LIMIT 1
), european_national_flights AS (
    SELECT source_airport.country,
        source_airport.timezone,
        COUNT(*) as num_flights
    FROM dbo.fact_flights flights
        JOIN dbo.dim_airports source_airport ON flights.fk_source_airport = source_airport.pk_airport
        JOIN dbo.dim_airports destination_airport ON flights.fk_destination_airport = destination_airport.pk_airport
    WHERE source_airport.country = destination_airport.country
        AND source_airport.continent = 'Europe'
    GROUP BY source_airport.country,
        source_airport.timezone
),
total_national_flights AS (
    SELECT country,
        SUM(num_flights) AS num_flights
    FROM european_national_flights
    GROUP BY country
),
total_european_national_flights AS (
    SELECT SUM(num_flights) AS total
    FROM total_national_flights
)
SELECT flights.country,
    flights.num_flights AS madrid_timezone_national_flights,
    flights.num_flights / total_national_flights.num_flights AS ratio_national_flights,
    flights.num_flights / (
        SELECT total
        FROM total_european_national_flights
    ) AS ratio_european_flights
FROM european_national_flights flights
    JOIN total_national_flights ON flights.country = total_national_flights.country
WHERE timezone = (
        SELECT timezone
        FROM madrid_timezone
    )
    AND total_national_flights.num_flights > 0
ORDER BY madrid_timezone_national_flights DESC;