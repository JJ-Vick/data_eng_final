## Final Project - Adult Income Data Engineering Pipeline

This project cleans and ingests the dirty Adult Income dataset from the course final project.

### Dataset

- Source file: `raw/project/adult-income-dirty.csv`
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

### Main Files

- Notebook: `prj/data_wrangling_adult_income.ipynb`
- Docker Compose: `etc/docker-compose.yml`
- SQL schema: `etc/sql/create_adult_income.sql`
- Generated clean CSV: `output/project/adult_income_clean.csv`

### Database

The project uses PostgreSQL through Docker Compose.

Run:

```bash
docker compose -f etc/docker-compose.yml up -d
# Adult Income Data Engineering Project

This project cleans the dirty Adult Income dataset and prepares it for ingestion into a PostgreSQL database.

The work follows the final project requirements:

- use a dirty dataset from the course repository
- document the workflow in GitHub
- clean the data as a data engineer
- use Docker Compose
- choose SQL or NoSQL
- ingest the cleaned data into a database

For this project, I chose the SQL path using PostgreSQL.

## Dataset

- Dataset: Adult Income
- Source: UCI Machine Learning Repository
- Data dictionary: https://archive.ics.uci.edu/dataset/2/adult
- Raw file: `raw/project/adult-income-dirty.csv`
- Clean file: `output/project/adult_income_clean.csv`

The raw file is kept in `raw/` and should not be edited directly.

## Folder Structure

```text
Data_Engineering/
  raw/project/adult-income-dirty.csv
  prj/data_cleaning_adult_income.ipynb
  prj/eda_adult_income.ipynb
  prj/README.md
  output/project/adult_income_clean.csv
  etc/docker-compose.yml
  etc/sql/create_adult_income.sql
```

## Cleaning Workflow

The notebook `prj/data_cleaning_adult_income.ipynb` performs the following steps:

1. Load the dirty CSV file using `;` as the separator.
2. Clean column names.
3. Drop the accidentally saved index column.
4. Remove extra spaces from text values.
5. Replace dirty missing values such as `?`, `N/A`, empty strings, and `unknown`.
6. Convert numeric columns to proper numeric data types.
7. Fix numeric values polluted with text, such as `43 YEARS`, `48 HRS`, and `0 USD`.
8. Remove impossible values such as negative ages.
9. Standardize categorical values such as `M`, `F`, `US`, and `United States`.
10. Remove duplicate rows.
11. Fill missing numeric values with the median.
12. Fill missing categorical values with `Unknown`.
13. Export the cleaned dataset to `output/project/adult_income_clean.csv`.

## Database Workflow

The project uses PostgreSQL through Docker Compose.

Start the database:

```bash
docker compose -f etc/docker-compose.yml up -d
```

Create the table:

```bash
docker cp etc/sql/create_adult_income.sql lab-postgres:/tmp/create_adult_income.sql
docker exec -i lab-postgres psql -U labuser -d labdb -f /tmp/create_adult_income.sql
```

Copy and ingest the cleaned CSV:

```bash
docker cp output/project/adult_income_clean.csv lab-postgres:/tmp/adult_income_clean.csv

docker exec -i lab-postgres psql -U labuser -d labdb
```

Inside `psql`, run:

```sql
\copy project.adult_income_clean (
    age,
    workclass,
    fnlwgt,
    education,
    education_num,
    marital_status,
    occupation,
    relationship,
    race,
    sex,
    capital_gain,
    capital_loss,
    hours_per_week,
    native_country,
    income,
    source_split
) FROM '/tmp/adult_income_clean.csv' WITH (FORMAT csv, HEADER true);

SELECT COUNT(*) FROM project.adult_income_clean;
SELECT income, COUNT(*) FROM project.adult_income_clean GROUP BY income ORDER BY income;
```

Adminer can be opened at:

```text
http://localhost:8080
```

Connection settings:

```text
System: PostgreSQL
Server: db
Username: labuser
Password: labpass
Database: labdb
```

## Workflow Checklist

- [ ] Create a new GitHub repository.
- [ ] Add a root `README.md` with a short project description.
- [ ] Make the first commit with the README.
- [x] Keep the raw dataset in `raw/project/`.
- [x] Create the cleaning notebook in `prj/`.
- [x] Clean the Adult Income dirty dataset.
- [x] Export the cleaned dataset.
- [ ] Create the SQL schema file.
- [ ] Use Docker Compose to run PostgreSQL.
- [ ] Ingest the cleaned CSV into PostgreSQL.
- [ ] Update the README with short notes about the work.
- [ ] Commit and push the final project files.

## Notes

- SQL/PostgreSQL was chosen because the course folder already includes a PostgreSQL Docker Compose setup.
- Outliers are reported but not automatically removed, because fields like capital gain and capital loss can naturally have extreme values.
- Raw and generated data should not be committed if they are ignored by `.gitignore`.
