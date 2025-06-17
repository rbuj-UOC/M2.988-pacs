DROP TABLE IF EXISTS dbo.fact_routes;
CREATE TABLE dbo.fact_routes (
    pk_route integer NOT NULL,
    fk_airline integer,
    fk_source_airport integer,
    fk_destination_airport integer,
    fk_plane integer,
    stops integer,
    PRIMARY KEY (pk_route)
);