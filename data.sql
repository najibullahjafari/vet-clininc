/* Populate database with sample data. */

INSERT INTO animals ( name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ( 'Agumon', '2020/2/3', 0, TRUE, 10.23);

INSERT INTO animals (name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2020/11/15', 2, TRUE, 8);

INSERT INTO animals (name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021/1/7', 1, FALSE, 15.04);

INSERT INTO animals ( name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ( 'Devimon', '2017/5/12', 5, TRUE, 11);

 INSERT INTO animals ( name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020/2/8', 0, FALSE, 11);

 INSERT INTO animals ( name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2020/11/15', 2, TRUE, 5.7);

INSERT INTO animals ( name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993/4/2', 3, FALSE, 12.13);

 INSERT INTO animals ( name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005/6/12', 1, TRUE, 45);

 INSERT INTO animals ( name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005/6/7', 7, TRUE, 20);

INSERT INTO animals ( name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998/10/13', 3, TRUE, 17);

 INSERT INTO animals (name, date_of_birth, secape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022/6/14', 4, TRUE, 22);




-- inserting DATABASE
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody pond', 77);

INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);

INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);



-- insert into species+++++++
INSERT into species(name) VALUES ('Pokemon');
INSERT into species(name) VALUES ('Digimon');




-- modify animals
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE name NOT LIKE '%mon';


-- Update animals to set owner_id based on owner's full_name
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');


INSERT INTO vets(name, age, date_of_graduation) VALUES( 'Vet William Tatcher ',45,'2000-04-23');
INSERT INTO vets(name, age, date_of_graduation) VALUES( 'Vet Maisy Smith ',26,'2019-01-17');
INSERT INTO vets(name, age, date_of_graduation) VALUES( 'Vet Stephanie Mendez ',64,'1981-05-08');
INSERT INTO vets(name, age, date_of_graduation) VALUES( 'Vet Jack Harkness ',64,'1981-05-08');

INSERT INTO specializations (vet_id, species_id)
VALUES (
    (SELECT id FROM vets WHERE name = 'Vet William Tatcher '),
    (SELECT id FROM species WHERE name = 'Pokemon')
);
INSERT INTO specializations (vet_id, species_id)
SELECT
    (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez ' LIMIT 1),
    (SELECT id FROM species WHERE name = 'Digimon' LIMIT 1)
UNION ALL
SELECT
    (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez ' LIMIT 1),
    (SELECT id FROM species WHERE name = 'Pokemon' LIMIT 1);
INSERT INTO specializations(vet_id, species_id)SELECT
  (SELECT id FROM vets WHERE name = 'Vet Jack Harkness '),
  (SELECT id FROM species WHERE name = 'Digimon');

INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Agumon' ),
  (SELECT id FROM vets WHERE name = 'Vet William Tatcher '),
  ('2020-05-24');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Agumon' ),
  (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez '),
  ('2020-07-22');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Gabumon' ),
  (SELECT id FROM vets WHERE name = 'Vet Jack Harkness '),
  ('2021-02-02');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Pikachu' ),
  (SELECT id FROM vets WHERE name = 'Vet Maisy Smith '),
  ('2020-01-05');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Pikachu' ),
  (SELECT id FROM vets WHERE name = 'Vet Maisy Smith '),
  ('2020-03-08');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Pikachu' ),
  (SELECT id FROM vets WHERE name = 'Vet Maisy Smith '),
  ('2020-05-14');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Devimon' ),
  (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez '),
  ('2021-05-04');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Charmander' ),
  (SELECT id FROM vets WHERE name = 'Vet Jack Harkness '),
  ('2021-02-24');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Plantmon' ),
  (SELECT id FROM vets WHERE name = 'Vet Maisy Smith '),
  ('2019-12-21');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Plantmon' ),
  (SELECT id FROM vets WHERE name = 'Vet William Tatcher '),
  ('2020-8-10');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Plantmon' ),
  (SELECT id FROM vets WHERE name = 'Vet Maisy Smith '),
  ('2021-4-7');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Squirtle' ),
  (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez '),
  ('2019-10-29');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Angemon' ),
  (SELECT id FROM vets WHERE name = 'Vet Jack Harkness '),
  ('2020-10-3');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Angemon' ),
  (SELECT id FROM vets WHERE name = 'Vet Jack Harkness '),
  ('2020-11-4');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Boarmon' ),
  (SELECT id FROM vets WHERE name = 'Vet Maisy Smith '),
  ('2019-1-24');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Boarmon' ),
  (SELECT id FROM vets WHERE name = 'Vet Maisy Smith '),
  ('2019-5-15');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Boarmon' ),
  (SELECT id FROM vets WHERE name = 'Vet Maisy Smith '),
  ('2020-2-27');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Boarmon' ),
  (SELECT id FROM vets WHERE name = 'Vet Maisy Smith '),
  ('2020-8-3');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Blossom' ),
  (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez '),
  ('2020-5-24');
INSERT INTO visits(animals_id, vets_id, visits_date)
SELECT
  (SELECT id FROM animals WHERE name = 'Blossom' ),
  (SELECT id FROM vets WHERE name = 'Vet William Tatcher '),
  ('2021-1-11');
