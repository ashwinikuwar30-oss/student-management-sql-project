# Student Management System (SQL Project)

# 📋 Project Overview

The Student Management System is a MySQL-based database project designed to manage student records, subjects, and marks efficiently.
It demonstrates core database design principles such as normalization, primary & foreign keys, and relationships between tables.

# 🏗️ Database Structure
The project contains the following tables:
Table Name	Description
Students	Stores student details like name, gender, and class.
Subjects	Stores the list of subjects offered.
Marks	Stores the marks obtained by each student in various subjects.

# 🧩 SQL Schema
CREATE DATABASE student_management;
USE student_management;

-- 1️⃣ Create Database
CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

-- 2️⃣ Create Students Table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    class VARCHAR(20)
);

-- 3️⃣ Create Subjects Table
CREATE TABLE IF NOT EXISTS Subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50)
);

-- 4️⃣ Create Marks Table
CREATE TABLE IF NOT EXISTS Marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

-- 5️⃣ Insert Sample Data

-- Students
INSERT INTO Students (name, age, gender, class) VALUES
('Aarav Sharma', 20, 'Male', 'FYBSc CS'),
('Priya Mehta', 21, 'Female', 'SYBSc CS'),
('Rahul Patil', 22, 'Male', 'TYBSc CS'),
('Sneha Desai', 20, 'Female', 'FYBSc CS'),
('Vikram Joshi', 21, 'Male', 'SYBSc CS');

-- Subjects
INSERT INTO Subjects (subject_name) VALUES
('Database Management Systems'),
('Data Structures'),
('Operating Systems'),
('Computer Networks'),
('Python Programming');

-- Marks
INSERT INTO Marks (student_id, subject_id, marks) VALUES
(1, 1, 85),
(1, 2, 78),
(1, 3, 90),
(2, 1, 88),
(2, 2, 67),
(2, 3, 73),
(3, 1, 91),
(3, 4, 82),
(4, 5, 95),
(5, 2, 76),
(5, 3, 84);

-- 6️⃣ Queries

-- View all students
SELECT * FROM Students;

-- View all subjects
SELECT * FROM Subjects;

-- Join students and marks with subject names
SELECT s.name AS Student_Name, sub.subject_name, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Subjects sub ON m.subject_id = sub.subject_id;

-- Average marks per student
SELECT s.name AS Student_Name, AVG(m.marks) AS Average_Marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name;

-- Top-performing students (average > 80)
SELECT s.name, AVG(m.marks) AS avg_marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name
HAVING avg_marks > 80
ORDER BY avg_marks DESC;

-- 7️⃣ Create a View for Easy Access
CREATE OR REPLACE VIEW student_performance AS
SELECT s.name AS Student_Name, s.class, sub.subject_name, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Subjects sub ON m.subject_id = sub.subject_id;

-- 8️⃣ Display View
SELECT * FROM student_performance;

⚙️ Technologies Used
MySQL / SQL Workbench
Relational Database Design
Data Querying and Aggregation
Joins, Keys, and Constraints

📈 Key Learnings
How to create and manage a relational database
Using primary and foreign keys to connect tables
Writing SQL queries for data extraction and analysis
Structuring a real-world database project for GitHub and LinkedIn

📎 Author

👩‍💻 Ashwini Kuwar
📍 BSc Computer Science Student
💼 Aspiring Data Analyst | SQL Learner | Tech Enthusiast
