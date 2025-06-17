DROP TABLE IF EXISTS dbo.stg_planes;
CREATE TABLE dbo.stg_planes (
    name character varying(100),
    iata character varying(5),
    icao character varying(5)
);