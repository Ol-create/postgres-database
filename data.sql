/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '3-2-2020', 0, true, 10.23),
       ('Gabumon', '15-11-2018', 2, true, 8), 
       ('Pikachu', '7-1-2021', 1, false, 15.04), 
       ('Devimon', '12-5-2017', 5, true, 11);
       
/* Start transaction; */
BEGIN TRANSACTION;

/* Update species record with digimon */
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

/* Update the remaining species record with pokemon */
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';

/* Save transaction */
COMMIT TRANSACTION;
BEGIN TRANSACTION;

/* Delete all records in the animals table, then roll back the transaction */
DELETE FROM animals;
ROLLBACK;
BEGIN TRANSACTION;

/* Delete all animals born after Jan 1st, 2022. */
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
SAVEPOINT jan_2022;

/* Update all animals' weight to be their weight multiplied by -1 */
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK jan_2022;

/* Update all animals' weights that are negative to be their weight multiplied by -1. */
UPDATE animals SET weight_kg = weight_kg* -1 WHERE weight_kg <0;
COMMIT TRANSACTION;
