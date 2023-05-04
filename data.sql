/* Populate database with sample data. */

insert into animals (name, date_of_birth, escape_attempts,neutered,weight_kg) 
values
('Agumon','2020-02-03', 0, true, 10.23), 
('Gabumon','2018-11-15',2,true,8 ),
('Pikachu','2021-01-07',1,false,15.04 ),
('Devimon','2017-05-12',5,true,11 );

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
values
('Charmander', '2020-02-08', 0, false, 11),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 2, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17),
('Ditto', '2022-05-14', 4, true, 22);

insert into owners(full_name, age)
 values 
 ('Sam Smith', 34),
 ('Jennifer Orwell', 19),
 ('Bob', 45),
 ('Melody Pond', 77),
 ('Dean Winchester', 14),
 ('Jodie Whittaker', 38);

insert into species(name) values('Pokemon');
insert into species(name) values('Digimon');

update animals set species_id = 2 where name like '%mon';
update animals set species_id = 1 where species_id is null;

update animals set owner_id = 1 where name = 'Agumon';
update animals set owner_id = 2 where name in ('Gabumon','Pikachu');
update animals set owner_id = 3 where name in ('Devimon','Plantmon');
update animals set owner_id = 4 where name in ('Charmander','Squirtle', 'Blossom');
update animals set owner_id = 5 where name in ('Angemon','Boarmon');


