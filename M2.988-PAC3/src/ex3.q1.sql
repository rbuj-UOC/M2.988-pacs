CREATE TABLE dbo.dim_airlines (
    pk_airline integer NOT NULL,
    name character varying(100),
    iata character varying(5),
    icao character varying(5),
    callsign character varying(100),
    country character varying(50),
    active boolean,
    PRIMARY KEY (pk_airline)
);