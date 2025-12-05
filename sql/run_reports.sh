#!/bin/bash

echo "Running SQL reports..."

# Directory with SQL scripts
BASE_DIR="/home/paulina/COVID19/sql"

# 1. Import all raw data into the database
psql -U postgres -d covid_project -f "$BASE_DIR/import_all.sql"

# 2. Create analytical view based on Worldometer data
psql -U postgres -d covid_project -f "$BASE_DIR/analysis_covid_worldometer.sql"

# 3. Generate analytical reports
psql -U postgres -d covid_project -f "$BASE_DIR/report_top10_countries.sql"
psql -U postgres -d covid_project -f "$BASE_DIR/report_trend_poland.sql"
psql -U postgres -d covid_project -f "$BASE_DIR/report_fatality_rate.sql"
psql -U postgres -d covid_project -f "$BASE_DIR/report_positivity_rate.sql"
psql -U postgres -d covid_project -f "$BASE_DIR/report_weekly_growth.sql"
psql -U postgres -d covid_project -f "$BASE_DIR/report_who_regions.sql"

echo "All reports executed successfully."

