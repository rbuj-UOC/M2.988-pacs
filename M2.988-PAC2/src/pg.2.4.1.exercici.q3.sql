-- Inserir a la taula airlines un nou registre amb els valors en els camps següents:
-- - Id: valor màxim del camp Id de tots els registres de la taula incrementat en 1.
--       Per obtenir el valor màxim s'haurà de fer una consulta prèvia
-- - name: el vostre 'loginuoc' assignat al campus
-- - active: false
-- - La resta de camps s'informaran amb els valors lliures que es considerin.
INSERT INTO dbo.airlines (id, name, iata, icao, callsign, country, active)
VALUES (
    (SELECT MAX(id) + 1 FROM dbo.airlines),
    'rbuj',
    NULL,
    NULL,
    NULL,
    NULL,
	false
);

SELECT id,
    name,
    active
FROM dbo.airlines
WHERE name = 'rbuj';