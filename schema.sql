/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id BIGINT NOT NULL PRIMARY KEY,
    name VARCHAR (100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(200);

CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(250),
    age INT
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(250)
);

ALTER TABLE animals DROP id;
ALTER TABLE animals ADD id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;

ALTER TABLE animals DROP COLUMN species;

-- ADD COLUMN SPECIES
ALTER TABLE animals ADD species_id INT;

-- ADD COLUMN OWNER_ID
 ALTER TABLE animals ADD owner_id INT;

-- set constraint for primary key species_id
 ALTER TABLE animals ADD CONSTRAINT fk_species_table FOREIGN KEY(species_id) REFERENCES species(id);
 -- set constraint for primary key owners-id
ALTER TABLE animals ADD CONSTRAINT fk_owner_table FOREIGN KEY(owner_id) REFERENCES owners(id);

-- Create table for vets
CREATE TABLE vets (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100),
    age integer,
    date_of_graduation date
);

-- Create table for specialization
CREATE TABLE specializations (
    vet_id integer NOT NULL,
    species_id integer NOT NULL,
    PRIMARY KEY (vet_id, species_id),
    CONSTRAINT fk_Vets  
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    CONSTRAINT fk_Species  
    FOREIGN KEY(species_id) REFERENCES species(id)
);

-- Create table for visits
CREATE TABLE visits (
    vet_id integer NOT NULL,
    animals_id integer NOT NULL,
    date_visited date,
    PRIMARY KEY (vet_id, animals_id, date_visited),
    CONSTRAINT fk_Vets  
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    CONSTRAINT fk_animals  
    FOREIGN KEY(animals_id) REFERENCES animals(id)
); 