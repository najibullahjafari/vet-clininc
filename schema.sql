/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

ALTER TABLE animals set
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE,
    secape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER Table animals ADD COLUMN species VARCHAR(255);