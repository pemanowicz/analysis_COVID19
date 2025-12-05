    SELECT 
        country_region,
        MAX(total_tests) AS total_tests,
        MAX(total_cases) AS total_cases,
        ROUND(
            (MAX(total_cases)::NUMERIC / NULLIF(MAX(total_tests), 0)) * 100, 
            2
        ) AS positivity_rate
    FROM covid19.worldometer_data
    WHERE total_tests IS NOT NULL
    GROUP BY country_region
    ORDER BY positivity_rate DESC
    LIMIT 10
