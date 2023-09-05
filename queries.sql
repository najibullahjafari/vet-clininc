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



-- Questions 
-- Who was the last animal seen by William Tatcher?
SELECT a.name
FROM animals a
JOIN visits v ON a.id = v.animals_id
JOIN vets vet ON v.visits_id = vet.id
WHERE vet.name = 'Vet William Tatcher '
ORDER BY v.visits_date DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT a.id) FROM vets v JOIN visits vi ON v.id = vi.vets_id JOIN animals a ON vi.animals_id = a.id WHERE v.name = 'Vet Stephanie Mendez ';
-- List all vets and their specialties, including vets with no specialties.
 SELECT vets.*, species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id LEFT JOIN species ON specializations.species_id = species.id;
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT a.name 
FROM animals a 
JOIN visits vi ON a.id = vi.animals_id
WHERE '2020-4-1' < vi.visits_date and vi.visits_date < '2020-8-30';
-- What animal has the most visits to vets?
SELECT
    a.name AS animal_name,
    COUNT(v.visits_id) AS visit_count
FROM animals AS a
LEFT JOIN visits AS v ON a.id = v.animals_id
GROUP BY a.name
ORDER BY visit_count DESC
LIMIT 1;
-- Who was Maisy Smith's first visit?
SELECT
    vets.name AS vet_name,
    MIN(visits.visits_date) AS first_visit
FROM animals
INNER JOIN visits ON animals.id = visits.animals_id
INNER JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Vet Maisy Smith '
GROUP BY vets.name
ORDER BY first_visit ASC;
-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT
    animals.name AS animal_name,
    vets.name AS vet_name,
    visits.visits_date AS visit_date
FROM visits
INNER JOIN (
    SELECT
        animals_id,
        MAX(visits_date) AS max_visit_date
    FROM visits
    GROUP BY animals_id
) AS latest_visits ON visits.animals_id = latest_visits.animals_id AND visits.visits_date = latest_visits.max_visit_date
INNER JOIN animals ON visits.animals_id = animals.id
INNER JOIN vets ON visits.vets_id = vets.id;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS num_visits
FROM visits AS v
INNER JOIN vets AS vet ON v.vets_id = vet.id
LEFT JOIN specializations AS s ON vet.id = s.vet_id AND v.animals_id = s.species_id
WHERE s.vet_id IS NULL;
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT
    s.name AS species_name,
    COUNT(*) AS visit_count
FROM visits AS v
JOIN animals AS a ON v.animals_id = a.id
JOIN species AS s ON a.species_id = s.id
WHERE v.vets_id = (SELECT id FROM vets WHERE name = 'Vet Maisy Smith ')
GROUP BY s.name
ORDER BY visit_count DESC
LIMIT 1;


explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;

SELECT COUNT(*) FROM visits where animals_id = 4;
SELECT * FROM visits where vets_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';


