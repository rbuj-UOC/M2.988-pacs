WITH internal_route AS (
    SELECT route.*
    FROM [dbo].[FACT_routes] AS route
        JOIN [dbo].[DIM_airports] AS source_airport ON route.fk_source_airport = source_airport.pk_airport
        JOIN [dbo].[DIM_airports] AS destination_airport ON route.fk_destination_airport = destination_airport.pk_airport
    WHERE destination_airport.country = destination_airport.country
)
SELECT airline.country,
    COUNT(*) AS [num_rutes]
FROM internal_route AS route
    JOIN [dbo].[DIM_airlines] AS airline ON route.fk_airline = airline.pk_airline
GROUP BY airline.country
ORDER BY COUNT(*) ASC;