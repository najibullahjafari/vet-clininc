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

CREATE Table vets(id SERIAL PRIMARY KEY, name VARCHAR(50), age INTEGER, date_of_graduation DATE);

CREATE Table specializations (specialization_id SERIAL PRIMARY KEY, vet_id INT, species_id INT,
Foreign Key (vet_id) REFERENCES  vets(id),
Foreign Key (species_id) REFERENCES species(id));


CREATE TABLE visits(
visits_id SERIAL PRIMARY KEY,
animals_id INT,
vets_id INT,
visits_date DATE,
Foreign Key (vets_id) REFERENCES vets(id),
Foreign Key (animals_id) REFERENCES animals(id));
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
-- to decrease the excution of first query:
CREATE INDEX ind_animal_id ON visits(animals_id);
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animals_id = 4;
CREATE INDEX id_vet ON visits(vets_id);
EXPLAIN ANALYZE SELECT * FROM visits WHERE vets_id = 2;
CREATE INDEX emial_id ON owners(email);
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
