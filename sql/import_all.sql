SET search_path TO covid19;
SET datestyle = 'MDY';

ALTER TABLE covid19.day_wise DROP CONSTRAINT IF EXISTS day_wise_pkey;
ALTER TABLE covid19.usa_county_wise DROP CONSTRAINT IF EXISTS usa_county_wise_pkey;

-- covid_19_clean_complete.csv
\COPY covid19.covid_19_clean_complete FROM 'data/covid_19_clean_complete.csv' DELIMITER ',' CSV HEADER;

-- country_wise_latest.csv
ALTER TABLE covid19.country_wise_latest ALTER COLUMN deaths_per_100_recovered TYPE TEXT USING deaths_per_100_recovered::TEXT;
\COPY covid19.country_wise_latest FROM 'data/country_wise_latest.csv' DELIMITER ',' CSV HEADER;

--worldometer_data.csv
\COPY covid19.worldometer_data FROM 'data/worldometer_data.csv' DELIMITER ',' CSV HEADER;

--day_wise.csv
\COPY covid19.day_wise FROM 'data/day_wise.csv' DELIMITER ',' CSV HEADER;

--usa_county_wise.csv
\COPY covid19.usa_county_wise FROM 'data/usa_county_wise.csv' DELIMITER ',' CSV HEADER;

--full_grouped.csv
\COPY covid19.full_grouped FROM 'data/full_grouped.csv' DELIMITER ',' CSV HEADER;

COMMIT;
