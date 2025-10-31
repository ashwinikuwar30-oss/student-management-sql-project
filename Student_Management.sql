CREATE DATABASE student_management;
USE student_management;
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    gender VARCHAR(10),
    class VARCHAR(20)
);
CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50)
);
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    date DATE,
    status VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
INSERT INTO Students (name, gender, class)
VALUES 
('Rahul Sharma', 'Male', 'FYBSc'),
('Priya Mehta', 'Female', 'FYBSc'),
('Amit Patel', 'Male', 'SYBSc'),
('Sneha Reddy', 'Female', 'TYBSc');
INSERT INTO Subjects (subject_name)
VALUES 
('Mathematics'),
('Physics'),
('Computer Science');
INSERT INTO Marks (student_id, subject_id, marks)
VALUES
(1, 1, 85),
(1, 2, 78),
(2, 1, 92),
(3, 3, 88),
(4, 2, 90);
INSERT INTO Attendance (student_id, date, status)
VALUES
(1, '2025-10-28', 'Present'),
(1, '2025-10-29', 'Absent'),
(2, '2025-10-28', 'Present'),
(3, '2025-10-28', 'Present'),
(4, '2025-10-29', 'Present');
SELECT * FROM Students;
SELECT * FROM Subjects;
SELECT * FROM Marks;
SELECT * FROM Attendance;
SELECT * FROM Students;
SELECT s.name, sub.subject_name, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Subjects sub ON m.subject_id = sub.subject_id;
SELECT s.name, AVG(m.marks) AS average_marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name;
SELECT sub.subject_name, MAX(m.marks) AS highest_marks
FROM Marks m
JOIN Subjects sub ON m.subject_id = sub.subject_id
GROUP BY sub.subject_name;
SELECT s.name, 
       SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS total_present,
       SUM(CASE WHEN a.status = 'Absent' THEN 1 ELSE 0 END) AS total_absent
FROM Students s
JOIN Attendance a ON s.student_id = a.student_id
GROUP BY s.name;
SELECT s.name, AVG(m.marks) AS avg_marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name
ORDER BY avg_marks DESC
LIMIT 3;
CREATE VIEW student_report AS
SELECT s.name, sub.subject_name, m.marks, a.status
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Subjects sub ON m.subject_id = sub.subject_id
LEFT JOIN Attendance a ON s.student_id = a.student_id;
SELECT * FROM student_report;
