/* Database schema to keep the structure of entire database. */

create database vet_clinic

create table animals (
id int GENERATED ALWAYS AS IDENTITY,
name varchar(50),
date_of_birth date,
escape_attempts int,
neutered boolean,
weight_kg decimal,
	PRIMARY KEY (id)
);

ALTER TABLE animals ADD species VARCHAR(250);


CREATE TABLE owners(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	full_name VARCHAR(250),
	age INT
);

CREATE TABLE species(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(250)
);


ALTER TABLE animals DROP COLUMN species;


ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);


ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);


CREATE TABLE vets(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(250),
	age INT,
	date_of_graduation date
);

CREATE TABLE specializations(
	vet_id INT REFERENCES vets(id),
	species_id INT REFERENCES species(id),
	PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits(
	animal_id INT REFERENCES animals(id),
	vet_id INT REFERENCES vets(id),
	date_of_visit date,
	PRIMARY KEY (animal_id, vet_id, date_of_visit)
);