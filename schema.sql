/* Database schema to keep the structure of entire database. */

CREATE TABLE animals 
  (id SERIAL, 
  name VARCHAR(255), 
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BOOLEAN, 
  weight_kg NUMERIC);
  
 /* Add a column species of type string */ 
ALTER TABLE animals ADD COLUMN species VARCHAR(225);
