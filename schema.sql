/* Database schema to keep the structure of entire database. */

CREATE TABLE animals 
  (id SERIAL, 
  name VARCHAR(255), 
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BOOLEAN, 
  weight_kg NUMERIC);
   
  /* Track data for backup */
  BEGIN TRANSACTION;
