DROP DATABASE IF EXISTS online_learning;
CREATE DATABASE online_learning;
USE online_learning;

-- Student 
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) NOT NULL,

    CONSTRAINT pk_student PRIMARY KEY (student_id),
    CONSTRAINT uq_student_email UNIQUE (email)
);

-- Instructor
CREATE TABLE Instructor (
    instructor_id INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,

    CONSTRAINT pk_instructor PRIMARY KEY (instructor_id),
    CONSTRAINT uq_instructor_email UNIQUE (email)
);

--  Course 
CREATE TABLE Course (
    course_id INT AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    total_sessions INT NOT NULL,
    instructor_id INT NOT NULL,

    CONSTRAINT pk_course PRIMARY KEY (course_id),
    CONSTRAINT ck_course_sessions CHECK (total_sessions > 0),
    CONSTRAINT fk_course_instructor 
        FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

-- Enrollment 
CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    enroll_date DATE NOT NULL,

    CONSTRAINT pk_enrollment PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_enroll_student 
        FOREIGN KEY (student_id) REFERENCES Student(student_id),
    CONSTRAINT fk_enroll_course 
        FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Result 
CREATE TABLE Result (
    student_id INT,
    course_id INT,
    mid_score DECIMAL(3,1),
    final_score DECIMAL(3,1),

    CONSTRAINT pk_result PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_result_student 
        FOREIGN KEY (student_id) REFERENCES Student(student_id),
    CONSTRAINT fk_result_course 
        FOREIGN KEY (course_id) REFERENCES Course(course_id),
    CONSTRAINT ck_mid_score CHECK (mid_score BETWEEN 0 AND 10),
    CONSTRAINT ck_final_score CHECK (final_score BETWEEN 0 AND 10)
);

-- INSERT DATA 
INSERT INTO Student (full_name, date_of_birth, email) VALUES
('Nguyễn Văn A', '2003-05-10', 'a@gmail.com'),
('Trần Thị B', '2002-11-20', 'b@gmail.com'),
('Lê Văn C', '2003-03-15', 'c@gmail.com'),
('Phạm Thị D', '2004-01-08', 'd@gmail.com'),
('Hoàng Văn E', '2002-09-25', 'e@gmail.com');

INSERT INTO Instructor (full_name, email) VALUES
('ThS. Nguyễn Minh', 'minh@uni.edu'),
('TS. Trần Hùng', 'hung@uni.edu'),
('ThS. Lê Hoa', 'hoa@uni.edu'),
('TS. Phạm Long', 'long@uni.edu'),
('ThS. Đỗ Lan', 'lan@uni.edu');

INSERT INTO Course (course_name, description, total_sessions, instructor_id) VALUES
('Cơ sở dữ liệu', 'Học về SQL và thiết kế CSDL', 15, 1),
('Lập trình Java', 'Java căn bản', 20, 2),
('Cấu trúc dữ liệu', 'Danh sách, cây, đồ thị', 18, 3),
('Mạng máy tính', 'Kiến thức mạng', 15, 4),
('Trí tuệ nhân tạo', 'Giới thiệu AI', 12, 5);

INSERT INTO Enrollment VALUES
(1, 1, '2025-01-10'),
(1, 2, '2025-01-11'),
(2, 1, '2025-01-10'),
(3, 3, '2025-01-12'),
(4, 4, '2025-01-13');

INSERT INTO Result VALUES
(1, 1, 7.5, 8.0),
(1, 2, 6.5, 7.0),
(2, 1, 8.0, 8.5),
(3, 3, 7.0, 7.5),
(4, 4, 6.0, 6.5);

-- UPDATE 
UPDATE Student
SET email = 'new_a@gmail.com'
WHERE student_id = 1;

UPDATE Course
SET description = 'SQL nâng cao và tối ưu CSDL'
WHERE course_id = 1;

UPDATE Result
SET final_score = 9.0
WHERE student_id = 1 AND course_id = 1;

-- DELETE (đúng thứ tự) 
DELETE FROM Result
WHERE student_id = 4 AND course_id = 4;

DELETE FROM Enrollment
WHERE student_id = 4 AND course_id = 4;

-- SELECT
SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Result;
