WITH routes AS (
    SELECT src.country AS src_country,
        dst.country AS dst_country
    FROM [dbo].[FACT_routes] AS r
        JOIN [dbo].[airports] AS src ON r.fk_source_airport = src.id
        JOIN [dbo].[airports] AS dst ON r.fk_destination_airport = dst.id
),
local_routes AS (
    SELECT route.src_country as country,
        COUNT(*) AS [num_rutes]
    FROM routes AS route
    WHERE route.src_country = route.dst_country
    GROUP BY route.src_country
),
international_routes AS (
    SELECT route.src_country as country,
        COUNT(*) AS [num_rutes]
    FROM routes AS route
    WHERE route.src_country <> route.dst_country
    GROUP BY route.src_country
),
all_routes AS (
    SELECT route.src_country as country,
        COUNT(*) AS [num_rutes]
    FROM routes AS route
    GROUP BY route.src_country
)
SELECT route.country AS country,
    international_routes.num_rutes AS num_international_routes,
    local_routes.num_rutes AS num_local_routes,
    route.num_rutes,
    100 * CAST(international_routes.num_rutes AS FLOAT) / route.num_rutes AS percentage_int_of_country,
    100 * CAST(international_routes.num_rutes AS FLOAT) / (
        SELECT SUM(num_rutes)
        FROM international_routes
    ) AS percentage_int_of_int,
    100 * CAST(international_routes.num_rutes AS FLOAT) / (
        SELECT SUM(num_rutes)
        FROM all_routes
    ) AS percentage_int_of_total
FROM all_routes AS route
    JOIN local_routes ON route.country = local_routes.country
    JOIN international_routes ON route.country = international_routes.country
WHERE route.num_rutes > 0
ORDER BY international_routes.num_rutes DESC;