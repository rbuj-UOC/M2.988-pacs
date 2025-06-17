SELECT planes.name AS aircraft_type,
    COUNT(*) AS num_routes
FROM dbo.fact_routes routes
    JOIN dbo.dim_planes planes ON routes.Fk_plane = planes.pk_plane
WHERE name IS NOT NULL
    AND name <> 'unknown'
GROUP BY aircraft_type
ORDER BY num_routes DESC
LIMIT 5;