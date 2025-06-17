-- crete dbo schema if not exists
CREATE SCHEMA IF NOT EXISTS dbo;
CREATE TABLE IF NOT EXISTS dbo.countries (
    name character varying(100) NOT NULL,
    iso_code character varying(2)
);
CREATE TABLE IF NOT EXISTS dbo.airlines (
    id INT NOT NULL,
    name character varying(100),
    iata character varying(5),
    icao character varying(5),
    callsign character varying(50),
    country character varying(100),
    active boolean
);