DROP TABLE IF EXISTS dbo.dim_planes;
CREATE TABLE dbo.dim_planes (
    pk_plane integer NOT NULL,
    name character varying(100),
    iata character varying(5),
    icao character varying(5),
    PRIMARY KEY (pk_plane)
);