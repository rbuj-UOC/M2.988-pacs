SELECT dt.year_ AS year,
    dt.month_ AS month,
    COUNT(flight.pk_flight) AS number_of_flights
FROM dbo.fact_flights flight
    JOIN dbo.dim_time dt ON flight.fk_date = dt.pk_date
GROUP BY dt.year_,
    dt.month_
ORDER BY dt.year_ DESC,
    dt.month_ DESC;