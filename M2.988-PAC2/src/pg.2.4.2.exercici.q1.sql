-- Es vol conèixer els països que només tenen una aerolínia
SELECT a.country
FROM dbo.airlines a
GROUP BY a.country
HAVING COUNT(*) = 1
ORDER BY a.country ASC;