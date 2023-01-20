/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    CREATE TABLE animal (
    id BIGINT NOT NULL PRIMARY KEY,
    name VARCHAR (100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);
