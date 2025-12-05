SELECT 
    date,
    SUM(confirmed) AS confirmed,
    LAG(SUM(confirmed)) OVER (ORDER BY date) AS prev_week,
    ROUND(
        (SUM(confirmed) - LAG(SUM(confirmed)) OVER (ORDER BY date))::NUMERIC 
        / NULLIF(LAG(SUM(confirmed)) OVER (ORDER BY date), 0) * 100,
        2
    ) AS weekly_growth_rate
FROM covid19.day_wise
GROUP BY date
ORDER BY date;
