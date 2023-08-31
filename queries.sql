/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals
WHERE date_of_birth > '2016-01-01' AND date_of_birth < '2019-01-01';
 
SELECT * FROM animals WHERE neutered = TRUE AND secape_attempts < 3;

SELECT * FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT (name, secape_attempts) FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;




-- Defining the species
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;
SELECT species from animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name = '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = NULL;
SELECT * FROM animals;
COMMIT;
SELECT species from animals;





-- deleting and ROLLBACK
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT COUNT(*) FROM animals;




-- DELETE ANIMALS WITH CONDITIONS
BEGIN;
DELETE  FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg *-1;
ROLLBACK TO SP1;
UPDATE animals SEt weight_kg= weight_kg * -1 WHERE weight_kg<0;

COMMIT;




-- ANSWER SOME QUESTIONS

SELECT count(*) FROM animals ;
SELECT * FROM animals WHERE secape_attempts = 0;

SELECT avg(weight_kg) FROM animals;

SELECT MAX(secape_attempts), neutered
FROM animals
GROUP BY neutered;

SELECT  MAX(weight_kg), MIN(weight_kg), species FROM animals
GROUP BY species;

SELECT AVG(secape_attempts),species FROM animals WHERE '1990-01-01'<date_of_birth AND date_of_birth<'2000-01-01' GROUP BY species;





-- answer some quesitioins;
SELECT a.name 
FROM animals a 
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody pond';
SELECT a.name 
FROM animals a 
JOIN species s ON a.species_id = s.id;

SELECT o.full_name, a.name 
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id
ORDER BY o.id;


SELECT s.name AS species_name, COUNT(a.id) AS animal_count
FROM species s
LEFT JOIN animals a ON s.id = a.species_id
GROUP BY s.name
ORDER BY species_name;


SELECT a.name AS animal_name
FROM animals a
JOIN species s ON a.species_id = s.id
JOIN owners o ON a.owner_id = o.id
WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';

SELECT a.name As animal_name
FROM animals a 
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' and a.secape_attempts = 0;

SELECT o.full_name, COUNT(a.id) AS total_animals
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY total_animals DESC
LIMIT 1;