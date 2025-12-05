-- Checking for missing data
SELECT country
FROM covid19.covid_world_analysis
WHERE confirmed IS NULL OR deaths IS NULL OR recovered IS NULL;

-- Checking whether the fatality rate is within the 0–100% range
SELECT country, fatality_rate
FROM covid19.covid_world_analysis
WHERE fatality_rate < 0 OR fatality_rate > 100;

-- Checking whether numeric values are positive
SELECT country
FROM covid19.covid_world_analysis
WHERE confirmed < 0 OR deaths < 0 OR recovered < 0;

-- Checking whether cases and deaths per million are calculated correctly (no NULL values)
SELECT country
FROM covid19.covid_world_analysis
WHERE cases_per_million IS NULL OR deaths_per_million IS NULL;

-- Checking for countries with negative case counts
SELECT * FROM covid19.country_wise_latest
WHERE confirmed < 0 OR deaths < 0 OR recovered < 0;

-- Checking for duplicate country entries
SELECT country, COUNT(*)
FROM covid19.country_wise_latest
GROUP BY country
HAVING COUNT(*) > 1;

