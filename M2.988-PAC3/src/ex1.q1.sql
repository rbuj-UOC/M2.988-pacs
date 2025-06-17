DROP TABLE IF EXISTS dbo.stg_airlines;
CREATE TABLE dbo.stg_airlines (
    id numeric,
    name character varying(100),
    iata character varying(5),
    icao character varying(5),
    callsign character varying(100),
    country character varying(50),
    active boolean
);