-- Mostrar les aerolínies que són del país amb codi ISO (ISO code) "US" i
-- tinguin el seu estat actiu
SELECT al.name,
    al.iata,
    al.icao,
    al.callsign,
    al.country,
    al.active
FROM dbo.airlines al
WHERE al.country = (
        SELECT c.name
        FROM dbo.countries c
        WHERE c.iso_code = 'US'
    )
AND al.active = true;