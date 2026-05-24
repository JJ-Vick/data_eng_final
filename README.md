## Final Project - Adult Income Data Engineering Pipeline

This project cleans and ingests the dirty Adult Income dataset from the course final project.

### Dataset

- Relative path: `data_eng_final\raw\adult-income-dirty.csv`
- Dataset: Adult Income

### Workflow

1. Load the semicolon-separated dirty CSV.
2. Remove the accidentally saved index column.
3. Standardize column names.
4. Trim whitespace from text fields.
5. Convert dirty missing markers such as `?`, `N/A`, blank values, and `unknown` to missing values.
6. Clean numeric fields polluted with text such as `43 YEARS`, `48 HRS`, and `0 USD`.
7. Apply domain checks for age, education number, final weight, capital gain/loss, and hours per week.
8. Standardize categorical values such as `US`, `United States`, `M`, `F`, `low-income`, and `high-income`.
9. Remove duplicate rows.
10. Impute numeric missing values with the median.
11. Fill categorical missing values with `Unknown`.
12. Export the cleaned dataset to `output/project/adult_income_clean.csv`.
13. Ingest the cleaned CSV into PostgreSQL using Docker Compose.

## Ingestion Validation

The cleaned dataset was copied into the PostgreSQL Docker container using `docker cp`.

The PostgreSQL copy command was used to ingest the CSV data into the `dataset` table.

Validation queries confirmed:

- successful row insertion
- correct table structure
- successful querying of ingested data

### Main Files

- Notebooks: 
`src/data_cleaning_adult_income.ipynb`; `src/eda_adult_income.ipynb`; `src/ingestion_adult_income.ipynb`
- Docker Compose: `data_eng_final\docker-compose.yml`
- SQL schema: `data_eng_final\src\create_adult_income.sql`
- Generated clean CSV: `data_eng_final\raw\adult_income_clean.csv`

