SELECT c.table_name,
    c.column_name,
    c.data_type,
    c.is_nullable
FROM information_schema.columns AS c
WHERE c.table_schema = 'dbo'
    AND c.table_name IN ('dim_airlines', 'dim_airports')
ORDER BY c.table_name,
    c.column_name;