-- Create a table named 'Worker' to store employee details
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

-- Insert records into the Worker table
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1, 'Ontks', 'Arora', 100000, '2019-02-14 00:00:00', 'Admin'),
(2, 'Harika', 'Verma', 80000, '2011-05-14 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 200000, '2026-02-14 00:00:00', 'Admin'),
(4, 'Singh', 'Unknown', 500000, '2028-02-14 08:00:00', 'Admin'),
(5, 'Vek', 'Thati', 500000, '2011-06-14 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200009, '2011-06-14 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2020-01-14 05:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 30000, '2011-04-14 03:00:00', 'Admin');

-- Select all workers whose salary is not between 100,000 and 200,000
SELECT * FROM Worker WHERE SALARY NOT BETWEEN 100000 AND 200000;

-- Select first names of all workers
SELECT FIRST_NAME FROM Worker;

-- Select workers with a salary of 100,000 in the HR department
SELECT * FROM Worker WHERE SALARY = 100000 AND DEPARTMENT = 'HR';

-- Select workers with a salary greater than 200,000
SELECT * FROM Worker WHERE SALARY > 200000;

-- Select workers with a salary of 100,008 in the HR department
SELECT * FROM Worker WHERE SALARY = 100008 AND DEPARTMENT = 'HR';

-- Select workers with a salary between 100,000 and 200,000
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 200000;

-- Select workers whose salary is not between 100,000 and 200,000
SELECT * FROM Worker WHERE SALARY NOT BETWEEN 100000 AND 200000;

-- Select workers with a salary between 200,000 and 400,000 and specific worker IDs
SELECT * FROM Worker WHERE SALARY BETWEEN 200000 AND 400000 AND WORKER_ID IN (1, 2, 3, 4, 5);

-- Describe the structure of the Worker table
DESC Worker;

-- Use the database named 'org123'
USE org123;

-- Select all records from the Worker table
SELECT * FROM Worker;

-- Select distinct departments from the Worker table
SELECT DISTINCT DEPARTMENT FROM Worker;

-- Select worker ID, first name, and department, categorizing salary into stages
SELECT WORKER_ID, FIRST_NAME, DEPARTMENT,
CASE
    WHEN SALARY > 3000000 THEN 'Rich People'
    WHEN SALARY BETWEEN 100000 AND 300000 THEN 'Middle Stage'
    ELSE 'Poor People'
END AS People_Stage
FROM Worker;

-- Select all workers in the Admin department, ordered by department in descending order
SELECT * FROM Worker WHERE DEPARTMENT = 'Admin' ORDER BY DEPARTMENT DESC;

-- Count total employees in the HR and Account departments
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS TOTAL_EMPLOYEES 
FROM Worker 
WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Account' 
GROUP BY DEPARTMENT;

-- Count total employees in each department, ordered by total employees in descending order
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS TOTAL_EMPLOYEES 
FROM Worker 
GROUP BY DEPARTMENT 
ORDER BY TOTAL_EMPLOYEES DESC 
LIMIT ALL;

-- Count total employees in each department, ordered by total employees, limiting to the top department
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS TOTAL_EMPLOYEES 
FROM Worker 
GROUP BY DEPARTMENT 
ORDER BY TOTAL_EMPLOYEES DESC 
LIMIT 1;