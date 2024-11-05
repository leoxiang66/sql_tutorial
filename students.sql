-- Drop tables if they already exist
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS enrollments;

-- Create students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY, -- student id (auto generated)
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    enrollment_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Create courses table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY, -- course id (auto generated)
    course_name TEXT NOT NULL,
    credits INTEGER NOT NULL CHECK (credits > 0)
);

-- Create enrollments table to track which students are enrolled in which courses
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    grade TEXT, -- Could be 'A', 'B', 'C', 'D', 'F'
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(course_id) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert data into students table
INSERT INTO students (name, email)
VALUES ('Alice Johnson', 'alice.johnson@example.com');
INSERT INTO students (name, email)
VALUES ('Bob Williams', 'bob.williams@example.com');

-- Insert data into courses table
INSERT INTO courses (course_name, credits)
VALUES ('Mathematics', 3);
INSERT INTO courses (course_name, credits)
VALUES ('Physics', 4);

-- Insert data into enrollments table
INSERT INTO enrollments (student_id, course_id, grade)
VALUES (1, 1, 'A');
INSERT INTO enrollments (student_id, course_id, grade)
VALUES (1, 2, 'B');
INSERT INTO enrollments (student_id, course_id, grade)
VALUES (2, 1, 'C');
INSERT INTO enrollments (student_id, course_id, grade)
VALUES (2, 2, 'A');