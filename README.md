# Student Management System (SQL Project)
## 📋 Project Overview

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

-- Table 1: Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    gender VARCHAR(10),
    class VARCHAR(20)
);

-- Table 2: Subjects
CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50)
);

-- Table 3: Marks
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

💡 Sample Queries
-- Insert sample data
INSERT INTO Students (name, gender, class)
VALUES ('Ravi Kumar', 'Male', '10A'),
       ('Priya Sharma', 'Female', '10B'),
       ('Amit Verma', 'Male', '10A');

INSERT INTO Subjects (subject_name)
VALUES ('Math'), ('Science'), ('English');

INSERT INTO Marks (student_id, subject_id, marks)
VALUES (1, 1, 85), (1, 2, 90), (2, 1, 78), (3, 3, 88);

-- Fetch student marks with subject names
SELECT s.name, sub.subject_name, m.marks
FROM Marks m
JOIN Students s ON m.student_id = s.student_id
JOIN Subjects sub ON m.subject_id = sub.subject_id;

-- Find top-performing students
SELECT s.name, AVG(m.marks) AS average_marks
FROM Marks m
JOIN Students s ON m.student_id = s.student_id
GROUP BY s.name
ORDER BY average_marks DESC;

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
