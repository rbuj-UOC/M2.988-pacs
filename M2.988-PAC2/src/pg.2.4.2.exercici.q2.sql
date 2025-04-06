-- Es vol conèixer les rutes actives amb destinació "Istanbul" d'aerolínies el país
-- de les quals sigui Alemanya
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
        SELECT t1.id
        FROM dbo.airlines t1
        WHERE t1.country = 'Germany'
            AND t1.active = true
    )
    AND r.destination_airport_id IN (
        SELECT t2.id
        FROM dbo.airports t2
        WHERE t2.city = 'Istanbul'
    );