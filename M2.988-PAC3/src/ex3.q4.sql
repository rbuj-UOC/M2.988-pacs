SELECT airlines.pk_airline,
    source_airports.pk_airport AS source_airport,
    destination_dim_airports.pk_airport AS destination_airport,
    routes.stops,
    routes.equipment
FROM dbo.stg_routes routes,
    dbo.dim_airlines airlines,
    dbo.dim_airports source_airports,
    dbo.dim_airports destination_dim_airports
WHERE routes.airline = airlines.iata
    AND airlines.active = true
    AND routes.source_airport = source_airports.iata
    AND routes.destination_airport = destination_dim_airports.iata;