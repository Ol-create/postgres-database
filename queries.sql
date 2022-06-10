/*Queries that provide answers to the questions from all projects.*/

/* Find all animals whose name ends in "mon" */
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019 */
SELECT name FROM animals WHERE date_of_birth >= '01-01-2016' AND date_of_birth <= '01-01-2019';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT name FROM animals WHERE neutered IS TRUE AND escape_attempts < 3;

/* List date of birth of all animals named either "Agumon" or "Pikachu" */
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

/* Find all animals that are neutered. */
SELECT * FROM animals WHERE neutered IS TRUE;

/* Find all animals not named Gabumon. */
SELECT * FROM animals WHERE name != 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg */
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* No of animal in the table = 11 */
SELECT COUNT(name) FROM animals;

/* No of animals that did not attempt escaping = 2 */
SELECT COUNT (name) FROM animals WHERE escape_attempts = 0;

/* Average weight of animals */
 SELECT AVG (weight_kg) FROM animals;
 
/* Who escapes the most, neutered or not neutered animals? */
SELECT neutered, SUM(escape_attempts)
FROM animals
GROUP BY neutered
ORDER BY sum DESC
LIMIT 1;

/* minimum and maximum weight of each type of animal */
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

/* average number of escape attempts per animal type of those born between 1990 and 2000 */
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '01-01-1990' AND date_of_birth <= '01-01-2000' GROUP BY species;

-- QUERIES USING JOIN
-- What animals belong to Melody Pond?
SELECT name FROM animals WHERE owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond');

-- List of all animals that are pokemon (their type is Pokemon).
SELECT name FROM animals WHERE species_id = (SELECT id FROM species WHERE name = 'Pokemon');

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name, COUNT(*) from animals JOIN species ON species.id = animals.species_id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT name FROM animals WHERE owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell');

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name FROM animals WHERE owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') AND escape_attempts = 0;

-- Who owns the most animals?
SELECT full_name, COUNT(*) FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY full_name ORDER BY COUNT(*) DESC LIMIT 1;


-- QUERIES USING JOIN TABLES
-- Who was the last animal seen by William Tatcher?
SELECT animals.name FROM vets 
  JOIN visits ON vets.id = visits.vets_id
  JOIN animals ON animals.id = visits.animals_id
  WHERE vets.name = 'William Tatcher'
  ORDER BY visits.date_of_visit DESC
  LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) as num_animals_visited from vets
	JOIN visits ON vets.id = visits.vets_id
	WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name as specialized_in FROM vets
	LEFT JOIN specializations ON specializations.vets_id = vets.id
	LEFT JOIN species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name as animal_name, visits.date_of_visit FROM animals
  JOIN visits ON visits.animals_id = animals.id
  JOIN vets ON vets.id = visits.vets_id
  WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
  
  -- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) as count FROM animals
  JOIN visits ON visits.animals_id = animals.id
  GROUP BY animals.name
  ORDER BY count DESC
  LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name FROM visits 
  JOIN vets ON vets.id = visits.vets_id
  JOIN animals ON animals.id = visits.animals_id
  WHERE vets.name = 'Maisy Smith'
  ORDER BY visits.date_of_visit
  LIMIT 1;
  
  -- Details for most recent visit: animal information, vet information, and date of visit.
SELECT * FROM visits
	JOIN animals ON animals.id = visits.animals_id
	JOIN vets ON vets.id = visits.vets_id
	ORDER BY date_of_visit
	LIMIT 1;
	
-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*)
	FROM visits
	JOIN animals ON animals.id = visits.animals_id
	JOIN vets ON vets.id = visits.vets_id
	JOIN specializations ON specializations.vets_id = visits.vets_id
	WHERE animals.species_id != specializations.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name as species, COUNT(*) FROM visits
	JOIN vets ON vets.id = visits.vets_id
	JOIN animals ON animals.id = visits.animals_id
	JOIN species ON species.id = animals.species_id
	WHERE vets.name = 'Maisy Smith'
	GROUP BY species.name
	ORDER BY count DESC
	LIMIT 1;
