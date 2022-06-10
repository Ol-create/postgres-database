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

/* Create owners table */
CREATE TABLE owners
  (id SERIAL PRIMARY KEY, 
  full_name VARCHAR(225), 
  age INT);
   
/* Create species table */
CREATE TABLE species
  (id SERIAL PRIMARY KEY, 
  name VARCHAR(225));
  
/* Alter table animals remove column species */
ALTER TABLE animals DROP COLUMN species;
   
/* Add primary key to id */
ALTER TABLE animals ADD PRIMARY KEY(id);

/* Add column species_id which is a foreign key referencing species table */
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);

/* Add column owner_id which is a foreign key referencing the owners table */
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES owners(id);

-- VETS
CREATE TABLE vets (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text,
    age integer,
    date_of_graduation date
);
CREATE UNIQUE INDEX vets_pkey ON vets(id int4_ops);

-- Join table specializations
CREATE TABLE specializations (
    vets_id integer REFERENCES vets(id) ON DELETE CASCADE,
    species_id integer REFERENCES species(id) ON DELETE CASCADE,
    CONSTRAINT specializations_pkey PRIMARY KEY (vets_id, species_id)
);

CREATE UNIQUE INDEX specializations_pkey ON specializations(vets_id int4_ops,species_id int4_ops);
