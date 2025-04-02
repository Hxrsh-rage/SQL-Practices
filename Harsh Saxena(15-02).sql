-- Create a new database named 'saturday'
CREATE DATABASE saturday;

-- Switch to the 'saturday' database
USE saturday;

-- Create a table named 'user' with specified columns
CREATE TABLE user (
  sl_no INT(5) NULL DEFAULT NULL,
  name VARCHAR(100) NULL DEFAULT NULL,
  email VARCHAR(100) NULL DEFAULT NULL
);

-- Retrieve all records from the 'user' table
SELECT * FROM user;

-- Create another database named 'crud'
CREATE DATABASE crud;

-- Switch to the 'crud' database
USE crud;

-- Create a table named 'user1' with specified columns
CREATE TABLE user1 (
  sl_no INT NULL DEFAULT NULL,
  name VARCHAR(100) NULL DEFAULT NULL,
  email VARCHAR(100) NULL DEFAULT NULL
);

-- Retrieve all records from the 'user1' table
SELECT * FROM user1;