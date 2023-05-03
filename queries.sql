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