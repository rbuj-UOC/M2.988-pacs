CREATE TABLE dbo.dim_airports (
    pk_airport integer NOT NULL,
    name character varying(100),
    city character varying(50),
    country character varying(50),
    iata character varying(5),
    icao character varying(5),
    latitude double precision,
    longitude double precision,
    altitude numeric,
    timezone character varying(50),
    tz character varying(50),
    PRIMARY KEY (pk_airport)
);