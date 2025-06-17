SELECT attname,
    null_frac,
    n_distinct,
    most_common_vals
FROM pg_stats
WHERE tablename = 'dim_airports'
    AND attname IN ('pk_airport', 'city', 'country', 'continent');