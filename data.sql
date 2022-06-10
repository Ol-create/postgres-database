/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '3-2-2020', 0, true, 10.23),
       ('Gabumon', '15-11-2018', 2, true, 8), 
       ('Pikachu', '7-1-2021', 1, false, 15.04), 
       ('Devimon', '12-5-2017', 5, true, 11);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Charmander', '08-02-2020', -11, TRUE, 0), 
       ('Plantmon', '15-11-2021', -5.7, TRUE, 2), 
       ('Squirtle', '02-04-1993', -12.13, FALSE, 3), 
       ('Angemon', '12-06-2005', -45, TRUE, 1), 
       ('Boarmon', '07-06-2005', 20.4, TRUE, 7), 
       ('Blossom', '13-10-1998', 17, TRUE, 3), 
       ('Ditto', '14-05-2022', 22, TRUE, 4);

/* Track data for backup */
BEGIN TRANSACTION;
/* Rename column species TO unspecified */
ALTER TABLE animals RENAME COLUMN species TO unspecified;
ROLLBACK TRANSACTION;
       
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

/* Insert data into owners table*/
INSERT INTO owners (full_name, age) 
VALUES ('Sam Smith', 34), 
       ('Jennifer Orwell', 19), 
       ('Bob', 45), 
       ('Melody Pond', 77), 
       ('Dean Winchester', 14), 
       ('Jodie Whittaker', 38);

/* Insert date into species table */
INSERT INTO species (name) 
VALUES ('Pokemon'), ('Digimon');

/* Modify your inserted animals so it includes the species_id value */
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

/* Modify your inserted animals to include owner information (owner_id) */
UPDATE animals SET owner_id = owners.id FROM owners WHERE name = 'Agumon' AND owners.full_name= 'Sam Smith' ;
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Gabumon','Pikachu') AND owners.full_name= 'Jennifer Orwell';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Devimon','Plantmon') AND owners.full_name= 'Bob';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Charmander','Squirtle', 'Blossom') AND owners.full_name= 'Melody Pond';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Angemon','Boarmon') AND owners.full_name= 'Dean Winchester';
