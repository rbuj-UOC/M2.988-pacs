WITH routes AS (
    SELECT pk_route,
        fk_airline,
        CASE
            WHEN source.country = destination.country THEN 'National'
            ELSE 'International'
        END AS route_type
    FROM dbo.fact_routes
        JOIN dbo.dim_airports source ON fact_routes.fk_source_airport = source.pk_airport
        JOIN dbo.dim_airports destination ON fact_routes.fk_destination_airport = destination.pk_airport
)
SELECT airline.name AS airline_name,
    routes.route_type,
    COUNT(fk_airline) AS total_routes,
    MIN(COUNT(*)) OVER (PARTITION BY routes.route_type) AS Min,
    MAX(COUNT(*)) OVER (PARTITION BY routes.route_type) AS Max,
    AVG(COUNT(*)) OVER (PARTITION BY routes.route_type) AS Avg,
    STDDEV(COUNT(*)) OVER (PARTITION BY routes.route_type) AS Stddev
FROM routes
    JOIN dbo.dim_airlines airline ON routes.fk_airline = airline.pk_airline
GROUP BY airline_name,
    route_type
ORDER BY route_type ASC,
    total_routes ASC,
    airline_name ASC;