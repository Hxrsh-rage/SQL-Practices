SHOW DATABASES;

USE org123;

CREATE TABLE Student (
    sno INT PRIMARY KEY,
    sname VARCHAR(20),
    age INT
);

INSERT INTO Student (sno, sname, age)
VALUES 
    (1, 'Ankit', 17),
    (2, 'Ramya', 18),
    (3, 'Ram', 16);

CREATE TABLE Course (
    cno INT PRIMARY KEY,
    cname VARCHAR(20)
);

SELECT * FROM Course;

INSERT INTO Course (cno, cname)
VALUES 
    (101, 'C'),
    (102, 'C++'),
    (103, 'DBMS');

CREATE TABLE Enroll (
    sno INT,
    cno INT,
    jdate DATE,
    PRIMARY KEY (sno, cno),
    FOREIGN KEY (cno)
        REFERENCES Course(cno)
        ON DELETE CASCADE
);

INSERT INTO Enroll (sno, cno, jdate)
VALUES (2, 105, '2022-05-05');

SELECT * FROM Enroll;

DESC Enroll;