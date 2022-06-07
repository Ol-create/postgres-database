/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '3-2-2020', 0, true, 10.23),
       ('Gabumon', '15-11-2018', 2, true, 8), 
       ('Pikachu', '7-1-2021', 1, false, 15.04), 
       ('Devimon', '12-5-2017', 5, true, 11);
/* Track data for backup */
BEGIN TRANSACTION;

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Charmander', '08-02-2020', -11, TRUE, 0), 
       ('Plantmon', '15-11-2021', -5.7, TRUE, 2), 
       ('Squirtle', '02-04-1993', -12.13, FALSE, 3), 
       ('Angemon', '12-06-2005', -45, TRUE, 1), 
       ('Boarmon', '07-06-2005', 20.4, TRUE, 7), 
       ('Blossom', '13-10-1998', 17, TRUE, 3), 
       ('Ditto', '14-05-2022', 22, TRUE, 4);

  
