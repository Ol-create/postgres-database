/*Queries that provide answers to the questions from all projects.*/

/* Find all animals whose name ends in "mon" */
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019 */
SELECT name FROM animals WHERE date_of_birth >= '01-01-2016' AND date_of_birth <= '01-01-2019';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT name FROM animals WHERE neutered IS TRUE AND escape_attempts < 3;
