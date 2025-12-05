-- Projekt COVID 19 GLOBAL SQL ANALYSIS 
-- Dataset CORONA VIRUS REPORT (KAGGLE - imdevskp)

CREATE SCHEMA covid19;

SET search_path TO covid19;

-- 1. Number of cases by country - covid_19_complete.csv

CREATE TABLE covid_19_clean_complete (
    province_state VARCHAR(100),
    country_region VARCHAR(100),
    lat NUMERIC(10,6),
    long NUMERIC(10,6),
    date DATE,
    confirmed INT,
    deaths INT,
    recovered INT,
    active INT,
    who_region VARCHAR(100)
);

-- 2. Number of cases by day - country_wise_latest.csv

CREATE TABLE country_wise_latest (
    country VARCHAR(100),
    confirmed INT,
    deaths INT,
    recovered INT,
    active INT,
    new_cases INT,
    new_deaths INT,
    new_recovered INT,
    deaths_per_100_cases NUMERIC(6,2),
    recovered_per_100_cases NUMERIC(6,2),
    deaths_per_100_recovered NUMERIC(6,2),
    confirmed_last_week INT,
    week_1_change INT,
    week_1_percent_increase NUMERIC(6,2),
    WHO_region VARCHAR(50)
);

-- 3. Demographic and economic data - worldometer_data.csv

CREATE TABLE worldometer_data (
    country_region        VARCHAR(100),
    continent              VARCHAR(50),
    population             BIGINT,
    total_cases            INT,
    new_cases              INT,
    total_deaths           INT,
    new_deaths             INT,
    total_recovered        INT,
    new_recovered          INT,
    active_cases           INT,
    serious_critical       INT,
    total_cases_per_million_pop NUMERIC(10,2),
    deaths_per_million_pop      NUMERIC(10,2),
    total_tests            BIGINT,
    tests_per_million_pop  NUMERIC(10,2),
    WHO_region             VARCHAR(50)
);

--4. Daily case counts (day_wise.csv)

CREATE TABLE day_wise (
    date DATE PRIMARY KEY,
    confirmed INT,
    deaths INT,
    recovered INT,
    active INT,
    new_cases INT,
    new_deaths INT,
    new_recovered INT,
    deaths_per_100_cases NUMERIC(6,2),
    recovered_per_100_cases NUMERIC(6,2),
    deaths_per_100_recovered NUMERIC(6,2),
    no_of_countries INT
);

--5. level case counts usa_county_wise.csv

CREATE TABLE usa_county_wise (
    uid INT PRIMARY KEY,
    iso2 VARCHAR(10),
    iso3 VARCHAR(10),
    code3 VARCHAR(10),
    fips NUMERIC(10,2),
    admin2 VARCHAR(100),
    province_state VARCHAR(100),
    country_region VARCHAR(100),
    lat NUMERIC(10,6),
    long NUMERIC(10,6),
    combined_key VARCHAR(255),
    date DATE,
    confirmed INT,
    deaths INT
);

-- 6. Country-level case counts (full_grouped.csv)

CREATE TABLE full_grouped (
    date DATE,
    country_region VARCHAR(100),
    confirmed INT,
    deaths INT,
    recovered INT,
    active INT,
    new_cases INT,
    new_deaths INT,
    new_recovered INT,
    WHO_region VARCHAR(50)
);
