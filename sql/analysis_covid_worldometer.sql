CREATE OR REPLACE VIEW covid19.covid_world_analysis AS
SELECT
    l.country,
    SUM(l.confirmed) AS confirmed,
    SUM(l.deaths) AS deaths,
    SUM(l.recovered) AS recovered,
    w.population,
    w.continent,
    -- fatality rate / mortality rate (%)
    ROUND((SUM(l.deaths)::NUMERIC / NULLIF(SUM(l.confirmed),0)) * 100, 2) AS fatality_rate,
    -- cases per million inhabitants
    ROUND((SUM(l.confirmed)::NUMERIC / NULLIF(w.population,0)) * 1000000, 2) AS cases_per_million,
    -- deaths per million inhabitants
    ROUND((SUM(l.deaths)::NUMERIC / NULLIF(w.population,0)) * 1000000, 2) AS deaths_per_million
FROM covid19.country_wise_latest AS l
JOIN covid19.worldometer_data AS w
    ON l.country = w.country_region
GROUP BY l.country, w.population, w.continent;

