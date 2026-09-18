-- Week 3 Database Assignment
-- Student Database Management
-- MySQL

CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

DROP TABLE IF EXISTS student;

CREATE TABLE student (
    id INT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    marks DECIMAL(5,2) NOT NULL,
    grade VARCHAR(20)
);

START TRANSACTION;

INSERT INTO student (id, fullName, age, nationality, gender, marks, grade)
VALUES
(1, 'Malik Gabriel', 26, 'South Sudanese', 'Male', 95, 'Excellent'),
(2, 'Tut Gatluak', 31, 'South Sudanese', 'Male', 88, 'Excellent'),
(3, 'Goanar Wer', 22, 'South Sudanese', 'Male', 82, 'Excellent'),
(4, 'Nyibol Nena', 23, 'South Sudanese', 'Female', 76, 'Very Good'),
(5, 'Nyasunday Bol', 25, 'South Sudanese', 'Female', 68, 'Very Good'),
(6, 'Oaman Musa', 27, 'Somali', 'Male', 59, 'Good'),
(7, 'Abdi Mohamed', 24, 'Somali', 'Male', 52, 'Good'),
(8, 'David Ter', 29, 'South Sudanese', 'Male', 45, 'Good'),
(9, 'Ngoti Harun', 28, 'Sudanese', 'Male', 38, 'Poor'),
(10, 'Ciza Djuma', 30, 'Burundian', 'Male', 29, 'Poor');

COMMIT;

START TRANSACTION;

UPDATE student
SET age = 20
WHERE id = 2;

COMMIT;

UPDATE student
SET grade = CASE
    WHEN marks >= 80 THEN 'Excellent'
    WHEN marks >= 60 THEN 'Very Good'
    WHEN marks >= 40 THEN 'Good'
    ELSE 'Poor'
END;

SELECT id, fullName, age, nationality, gender, marks, grade
FROM student
ORDER BY marks DESC;

SELECT
    COUNT(*) AS total_students,
    ROUND(AVG(marks), 2) AS average_mark,
    MAX(marks) AS highest_mark,
    MIN(marks) AS lowest_mark
FROM student;

SELECT grade, COUNT(*) AS number_of_students
FROM student
GROUP BY grade
ORDER BY CASE grade
    WHEN 'Excellent' THEN 1
    WHEN 'Very Good' THEN 2
    WHEN 'Good' THEN 3
    WHEN 'Poor' THEN 4
END;
