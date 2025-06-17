-- Obtenir els aeroports que pertanyen al país amb codi ISO "AU". Per a això,
-- s'haurà de realitzar una consulta sobre la taula countries mitjançant la qual
-- obtenir el camp name per al codi ISO "AU", i una segona consulta sobre la taula
-- airports utilitzant una condició sobre el camp country perquè filtri pel nom
-- obtingut anteriorment.

SELECT *
	FROM dbo.airports
	WHERE country =
		(SELECT name
			FROM dbo.countries
			WHERE iso_code = 'AU');
