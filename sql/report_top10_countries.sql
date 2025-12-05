SELECT 
        country,
        SUM(confirmed) AS total_confirmed,
        SUM(deaths) AS total_deaths,
        SUM(recovered) AS total_recovered,
        SUM(active) AS total_active
    FROM covid19.country_wise_latest
    GROUP BY country
    ORDER BY total_confirmed DESC
LIMIT 10;
