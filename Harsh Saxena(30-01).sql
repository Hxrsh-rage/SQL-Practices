-- Display all databases in the server
SHOW DATABASES;

-- Create a new database named 'VIT'
CREATE DATABASE VIT;

-- Remove the 'VIT' database
DROP DATABASE VIT;

-- Switch to the 'ViT' database
USE ViT;

-- Create a table named 'CSE' with specified columns
CREATE TABLE CSE (
    s_id INT,
    s_name VARCHAR(30),
    s_mark INT
);

-- Drop the 'CSE' table
DROP TABLE CSE;

-- Show all tables in the 'VIT' database
SHOW TABLES FROM VIT;

-- Retrieve all records from the 'CSE' table
SELECT * FROM CSE;

-- Insert student records into the 'CSE' table
INSERT INTO CSE VALUES (1001, 'Ram Prasad', 99);
INSERT INTO CSE VALUES (1002, 'Shubham', 100);
INSERT INTO CSE VALUES (1003, 'Anjali', 95);
INSERT INTO CSE VALUES (1004, 'Shubh', 98);
INSERT INTO CSE VALUES (1005, 'Palak', 94);

-- Add a new column 's_contact' to the 'CSE' table
ALTER TABLE CSE ADD (
    s_contact INT
);

-- Describe the structure of the 'CSE' table
DESC CSE;

-- Remove the 's_contact' column from the 'CSE' table
ALTER TABLE CSE DROP COLUMN s_contact;

-- Add a new column 's_country' to the 'CSE' table with a default value
ALTER TABLE CSE ADD (
    s_country VARCHAR(50) DEFAULT 'India'
);

-- Insert a new student record into the 'CSE' table, specifying the country
INSERT INTO CSE VALUES (1006, 'Shubham Raj Sharma', 98, 'USA');