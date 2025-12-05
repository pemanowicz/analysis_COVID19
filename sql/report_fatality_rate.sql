CREATE TABLE covid19.report_fatality_clean AS
SELECT
    l.country,
    SUM(l.confirmed) AS total_confirmed,
    SUM(l.deaths) AS total_deaths,
    MAX(w.population) AS population,
    ROUND((SUM(l.deaths)::NUMERIC / NULLIF(SUM(l.confirmed), 0)) * 100, 2) AS fatality_rate
FROM covid19.country_wise_latest AS l
INNER JOIN covid19.worldometer_data AS w
ON l.country = w.country_region
GROUP BY l.country
ORDER BY fatality_rate DESC;

