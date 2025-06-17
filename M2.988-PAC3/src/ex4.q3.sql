WITH destination_airport AS (
    SELECT route.fk_destination_airport AS airport_id,
        COUNT(*) AS [num_destination_rutes]
    FROM [dbo].[FACT_routes] AS route
    GROUP BY route.fk_destination_airport
),
source_airport AS (
    SELECT route.fk_source_airport as airport_id,
        COUNT(*) AS [num_source_rutes]
    FROM [dbo].[FACT_routes] AS route
    GROUP BY route.fk_source_airport
)
SELECT airport.name,
    source_airport.num_source_rutes,
    destination_airport.num_destination_rutes
FROM [dbo].[airports] airport
    JOIN source_airport ON airport.id = source_airport.airport_id
    JOIN destination_airport ON airport.id = destination_airport.airport_id
ORDER BY source_airport.num_source_rutes DESC,
    destination_airport.num_destination_rutes DESC;