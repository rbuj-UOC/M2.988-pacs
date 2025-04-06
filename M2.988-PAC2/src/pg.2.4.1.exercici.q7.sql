-- Mostrar les rutes l'aeroport d'origen de les quals és
-- "London Heathrow Airport"
SELECT r.airline,
    r.airline_id,
    r.source_airport,
    r.source_airport_id,
    r.destination_airport,
    r.destination_airport_id,
    r.stops,
    r.equipment
FROM dbo.routes r
WHERE r.source_airport_id IN (
        SELECT ap.id
        FROM dbo.airports ap
        WHERE ap.name = 'London Heathrow Airport'
    );