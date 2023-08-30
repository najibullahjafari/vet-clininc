/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE,
    secape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);
