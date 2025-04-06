-- Mostrar les rutes l'aerolínia de les quals no està operativa (active = false).
-- Limitar els resultats a 10 rutes.
SELECT r.airline,
    r.airline_id,
    r.source_airport,
    r.source_airport_id,
    r.destination_airport,
    r.destination_airport_id,
    r.stops,
    r.equipment
FROM dbo.routes r
WHERE r.airline_id IN (
        SELECT al.id
        FROM dbo.airlines al
        WHERE al.active = false
    )
LIMIT 10;