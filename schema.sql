/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals
(
    id SERIAL,
    name VARCHAR(50),
    date_of_birth DATE,
    secape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER Table animals ADD COLUMN species VARCHAR(255);

CREATE Table owners(id SERIAL, full_name VARCHAR(32), age INT);
ALTER TABLE owners
ADD CONSTRAINT ID_PK PRIMARY KEY(id);
CREATE Table species(id SERIAL, name VARCHAR(90));
ALTER TABLE species
ADD CONSTRAINT I_PK PRIMARY KEY(id);
ALTER Table animals DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INTEGER REFERENCES owners(id);
