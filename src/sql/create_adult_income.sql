DROP TABLE IF EXISTS dataset;

CREATE TABLE dataset (
    id SERIAL PRIMARY KEY,
    age INTEGER,
    workclass VARCHAR(255),
    fnlwgt INTEGER,
    education VARCHAR(255),
    education_num INTEGER,
    marital_status VARCHAR(255),
    occupation VARCHAR(255),
    relationship VARCHAR(255),
    race VARCHAR(255),
    sex VARCHAR(255),
    capital_gain INTEGER,
    capital_loss INTEGER,
    hours_per_week INTEGER,
    native_country VARCHAR(255),
    income VARCHAR(255),
    source_split VARCHAR(255)
);