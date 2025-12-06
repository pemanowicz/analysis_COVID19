# COVID-19 Data Analysis Project

This project provides a complete end-to-end workflow for COVID-19 data processing, analysis, and reporting.
It integrates multiple datasets, loads them into a PostgreSQL database, performs analytical transformations using SQL, and generates automated visual reports using Python.

The goal of this project is to integrate COVID-19 data from multiple public sources (including Kaggle and Worldometer) into a unified analytical environment.
By combining SQL-based data engineering with Python-based analytics, the project delivers a reproducible pipeline for cleaning, transforming, analyzing, and visualizing pandemic-related data.

## Project Structure
- `data_raw/` - Raw COVID-19 datasets (CSV)
- `sql/` - SQL scripts for database structure, views, and reports
- `notebooks/` - Python notebooks for analysis and visualization
- `reports/` - Generated charts and analytical outputs
- `tests/` - Data quality tests
- `requirements.txt/` - Python dependencies
- `README.md/` - Project documentation

## Tech Stack

- **SQL** (PostgreSQL)
- **Python** (Pandas, Plotly, Matplotlib)
- **Bash / Shell**
- **Jupyter Notebook**
- **Git & GitHub**

## How to Run the Project

### 1. Create PostgreSQL database

``` sql
CREATE DATABASE covid_project;
```
### 2. Import schema and raw data

Run the SQL scripts that create the database tables and load all
datasets:

``` bash
psql -U postgres -d covid_project -f sql/create_table.sql
psql -U postgres -d covid_project -f sql/import_all.sql
```

### 3. Generate all analytical reports

Use the automated shell script to run all SQL analyses and produce
report tables:

``` bash
./sql/run_reports.sh
```

## Available Reports

After running the pipeline, you will find analytical outputs in the
`reports/` directory, including:

-   Weekly COVID-19 growth rate\
-   Positivity rate by country\
-   Fatality rate analysis\
-   Top 10 countries by confirmed cases\
-   WHO regional summaries\
-   World map visualization (HTML)

## Data Quality Tests

Located in `tests/`:

-   Check for missing or negative values\
-   Validate fatality rate range (0--100%)\
-   Ensure numeric columns contain positive numbers\
-   Validate correctness of per-million indicators\
-   Detect duplicate country records

## Data Sources

-   **Kaggle COVID-19 Dataset**\
-   **Worldometer COVID-19 Global Statistics**
