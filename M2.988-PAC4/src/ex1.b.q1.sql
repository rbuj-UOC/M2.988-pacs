SELECT airlines.name AS airline_name,
    COUNT(*) AS route_count
FROM dbo.fact_routes routes
    JOIN dbo.dim_airlines airlines ON routes.fk_airline = airlines.pk_airline
GROUP BY airline_name
ORDER BY route_count DESC;