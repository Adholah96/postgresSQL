/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon'
select name from animals where date_of_birth between'2016-01-01' AND '2019-12-31'
select name from animals where (neutered = true) and (escape_attempts < 3)
select date_of_birth from animals where name in ('Agumon','Pikachu')
select name,escape_attempts from animals where weight_kg > 10.5
select * from animals where neutered in (true)
select * from animals where name not in ('Gabumon')
select * from animals where weight_kg between 10.4 and 17.3



begin;
update animals set species = 'unspecified';
select * from animals;
rollback;
select * from animals;

begin;
update animals set species = 'digimon' where name like '%mon';
update animals set species = 'pokemon' where species is null;
commit;
select * from animals;

begin;
delete from animals;
rollback;
select * from animals;

begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint first_savepoint;
update animals set weight_kg = weight_kg * -1;
rollback to savepoint first_savepoint;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, sum(escape_attempts) from animals group by neutered;
select species, min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;


select * from animals join owners on animals.owner_id = owners.id where owners.full_name = 'Melody Pond' ;
select * from animals a join species s on a.species_id = s.id where s.name = 'Pokemon';
select owners.*, animals.name as animal_name from owners left join animals on owners.id = animals.owner_id;
select s.name, count(a.id) from species s left join animals a on s.id = a.species_id group by s.name;
select a.* from owners o join animals a on o.id = a.owner_id join species s on a.species_id = s.id where o.full_name = 'Jennifer Orwell' and s.name = 'Digimon';
select * from animals a join owners o on a.owner_id = o.id where o.full_name = 'Dean Winchester' and a.escape_attempts = 0;
select o.full_name, count(a.*) as number_of_animals from owners o left join animals a on o.id = a.owner_id group by o.full_name order by number_of_animals desc;
