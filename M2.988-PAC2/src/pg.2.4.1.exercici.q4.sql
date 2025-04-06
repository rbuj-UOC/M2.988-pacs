-- Actualitzar el registre inserit en el punt anterior, perquè tingui el camp
-- active = true, i realitzar una consulta per visualitzar el canvi.
UPDATE dbo.airlines
SET active = true
WHERE name = 'rbuj';

SELECT id,
    name,
    active
FROM dbo.airlines
WHERE name = 'rbuj';