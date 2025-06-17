DROP TABLE IF EXISTS dbo.stg_routes;
CREATE TABLE dbo.stg_routes (
    airline character varying(5),
    source_airport character varying(5),
    destination_airport character varying(5),
    stops numeric,
    equipment character varying(50)
);
