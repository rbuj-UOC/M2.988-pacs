CREATE TABLE dbo.fact_routes (
    pk_route integer NOT NULL,
    fk_airline integer,
    fk_source_airport integer,
    fk_destination_airport integer,
    stops integer,
    equipment character varying(3),
    PRIMARY KEY (pk_route)
);