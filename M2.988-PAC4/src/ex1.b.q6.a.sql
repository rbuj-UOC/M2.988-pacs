SELECT airline.name AS airline_name,
    COUNT(fk_airline) AS total_routes,
    MIN(COUNT(*)) OVER () AS Min,
    MAX(COUNT(*)) OVER () AS Max,
    AVG(COUNT(*)) OVER () AS Avg,
    STDDEV(COUNT(*)) OVER () AS Stddev
FROM dbo.fact_routes
    JOIN dbo.dim_airlines airline ON fact_routes.fk_airline = airline.pk_airline
GROUP BY airline_name
ORDER BY total_routes ASC;