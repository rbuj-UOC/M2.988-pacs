SELECT
    airline.country,
    COUNT(*) AS [num_rutes]
FROM
    [dbo].[FACT_routes] AS route
    JOIN [dbo].[DIM_airlines] AS airline ON route.fk_airline = airline.pk_airline
GROUP BY airline.country
ORDER BY COUNT(*) ASC;