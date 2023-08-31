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

