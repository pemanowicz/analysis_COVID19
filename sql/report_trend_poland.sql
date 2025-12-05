SELECT 
    date, confirmed, deaths, recovered
FROM covid19.full_grouped
WHERE country_region = 'Poland'
ORDER BY date;
