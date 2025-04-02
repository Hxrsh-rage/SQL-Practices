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

USE org123;

CREATE TABLE student (
    s_id INT PRIMARY KEY,
    s_name VARCHAR(25) NOT NULL,
    s_department VARCHAR(25) NOT NULL
);

INSERT INTO student VALUES 
    (1001, 'Shubham', 'CSE'), 
    (1002, 'Joy', 'CSE'), 
    (1003, 'Ujjwal', 'CSE');

SELECT * FROM student;

CREATE TABLE VIT (
    s_id INT PRIMARY KEY,
    s_cgpa VARCHAR(5) NOT NULL
);

INSERT INTO VIT VALUES 
    (1001, '8.2'), 
    (1003, '8.5'), 
    (1007, '9.5');

SELECT * FROM VIT;

USE org123;

SELECT * FROM student CROSS JOIN VIT;

SELECT * FROM student 
INNER JOIN VIT ON student.s_id = VIT.s_id;

SELECT * FROM student 
NATURAL JOIN VIT;

SELECT * FROM student 
LEFT JOIN VIT ON student.s_id = VIT.s_id;

SELECT * FROM student 
RIGHT JOIN VIT ON student.s_id = VIT.s_id;

SELECT * FROM student 
FULL JOIN VIT;

SELECT * FROM student 
FULL OUTER JOIN VIT ON student.s_id = VIT.s_id;