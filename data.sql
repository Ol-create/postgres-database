/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '3-2-2020', 0, true, 10.23),
       ('Gabumon', '15-11-2018', 2, true, 8), 
       ('Pikachu', '7-1-2021', 1, false, 15.04), 
       ('Devimon', '12-5-2017', 5, true, 11);
/* Track data for backup */
BEGIN TRANSACTION;

  
