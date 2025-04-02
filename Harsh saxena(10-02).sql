USE org123;

SELECT * FROM worker;

SELECT department, COUNT(department) 
FROM worker 
WHERE department IN ('admin', 'account') 
GROUP BY department;

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

SELECT department, COUNT(department) AS highest_head_count
FROM worker
GROUP BY department
HAVING COUNT(department) >= 3;

CREATE TABLE vitBhopal (
    id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    department VARCHAR(25) NOT NULL
);

INSERT INTO vitBhopal VALUES 
    (104, 'Shubham', 'cs'), 
    (103, 'Anjali', 'BEd');

CREATE TABLE vit (
    id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    department VARCHAR(25) NOT NULL
);

INSERT INTO vit VALUES 
    (104, 'Shubham', 'Samastipur'), 
    (103, 'Anjali', 'Vidyapati');

SELECT * FROM vit;

SELECT * FROM vitBhopal;

SELECT name AS WinnerOfTheYear 
FROM vitBhopal 
WHERE id = (SELECT id FROM vit WHERE college = 'bhopal');