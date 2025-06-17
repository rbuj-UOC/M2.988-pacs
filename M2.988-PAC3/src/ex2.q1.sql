-- Consulta d’una columna de tipus alfanumèric
SELECT COUNT(*) AS total,
    100.0 * count(name) / count(1) as Percent_not_null,
    MIN(LENGTH(name)) AS min_length,
    MAX(LENGTH(name)) AS max_length,
    COUNT(DISTINCT name) AS total_distinct
FROM dbo.stg_airlines;
-- Consulta d’una columna de tipus numèric
SELECT COUNT(*) AS total,
    100.0 * count(id) / count(1) as Percent_not_null,
    MIN(id) AS min,
    MAX(id) AS max,
    COUNT(DISTINCT id) AS total_distinct
FROM dbo.stg_airlines;
-- Consulta d’una columna de tipus booleà
SELECT COUNT(*) AS total,
    100.0 * count(active) / count(1) as Percent_not_null,
    COUNT(DISTINCT active) AS total_distinct
FROM dbo.stg_airlines;