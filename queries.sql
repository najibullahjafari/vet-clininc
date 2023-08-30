/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals
WHERE date_of_birth > '2016-01-01' AND date_of_birth < '2019-01-01';
 
SELECT * FROM animals WHERE neutered = TRUE AND secape_attempts < 3;

SELECT * FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT (name, secape_attempts) FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;