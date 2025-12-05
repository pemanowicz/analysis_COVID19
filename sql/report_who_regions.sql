SELECT 
    who_region,
    SUM(confirmed) AS total_cases,
    SUM(deaths) AS total_deaths
FROM covid19.country_wise_latest
GROUP BY who_region
ORDER BY total_cases DESC;
