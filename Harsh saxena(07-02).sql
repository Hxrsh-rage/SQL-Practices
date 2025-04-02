CREATE DATABASE org123;

USE org123;

CREATE TABLE category (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(25) NOT NULL UNIQUE,
    c_decrp VARCHAR(250) NOT NULL
);

INSERT INTO category VALUES (102, 'furnitures', 'It stores all sets of wooden items');

SELECT * FROM category;

DESC category;

CREATE TABLE Products (
    P_ID INT PRIMARY KEY,
    p_Name VARCHAR(250) NOT NULL,
    c_id INT,
    CONSTRAINT fk_category FOREIGN KEY (c_id)
    REFERENCES category(c_id)
);

DESC Products;

DROP TABLE Products;

INSERT INTO Products VALUES (904, 'Wooden table', NULL);

SELECT * FROM Products;

SELECT * FROM category;

DELETE FROM category WHERE c_id = 101;

DROP TABLE category;