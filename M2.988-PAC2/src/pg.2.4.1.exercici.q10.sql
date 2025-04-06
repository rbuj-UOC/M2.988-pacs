-- Per a cada aerolínia, mostrar el nombre de rutes internacionals (país d'origen
-- diferent del país de destinació). s'ha de mostrar tant el nom de l’aerolínia com
-- els seus codis IATA i ICAO, i ordenat per nom d'aerolínia de forma ascendent.
WITH international_route AS (
	SELECT r.airline_id,
		COUNT(*) AS num_int_routes
	FROM dbo.routes r
		JOIN dbo.airports src ON r.source_airport = src.iata
		JOIN dbo.airports dst ON r.destination_airport = dst.iata
	WHERE src.country <> dst.country
	GROUP BY(r.airline_id)
)
SELECT al.name,
	al.iata,
	al.icao,
	ir.num_int_routes
FROM dbo.airlines al
	JOIN international_route ir ON al.id = ir.airline_id
ORDER BY al.name ASC;