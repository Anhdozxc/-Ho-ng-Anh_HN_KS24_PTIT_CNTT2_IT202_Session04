drop database ex;
CREATE database ex;
use ex;

-- Phần 1: Nhóm lệnh DDL (Tạo bảng & Ràng buộc)
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Bảng Khóa học
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0)
);

-- Bảng Đăng ký học phần
CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    grade DECIMAL(4,1) DEFAULT 0,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
-- PHẦN 2: DML - THÊM DỮ LIỆU

-- Thêm dữ liệu bảng Student
INSERT INTO Student VALUES
(1, 'Nguyen Dinh Son', 'Son@gmail.com', '0901111111'),
(2, 'Nguyen Duc Anh', 'Danh@gmail.com', '0902222222'),
(3, 'Do Hoang Anh', 'Hanh@gmail.com', '0903333333'),
(4, 'Nguyen Viet Trung', 'Trung@gmail.com', '0904444444'),
(5, 'Dinh Quang Huy', 'Huy@gmail.com', '0905555555');

-- Thêm dữ liệu bảng Course
INSERT INTO Course VALUES
(1, 'CSDL Co Ban', 3),
(2, 'Lap Trinh C', 4),
(3, 'CTDL & GT', 3),
(4, 'Mang May Tinh', 3),
(5, 'Javascript', 4);

-- Thêm dữ liệu bảng Enrollment
INSERT INTO Enrollment VALUES
(1, 1, 7.5),
(2, 3, 8.0),
(3, 2, 6.5),
(4, 4, 7.0),
(5, 5, 8.5);

-- PHẦN 2: CẬP NHẬT DỮ LIỆU
-- Cập nhật điểm SV mã 2, khóa học mã 3 thành 9.0
UPDATE Enrollment
SET grade = 9.0
WHERE student_id = 2 AND course_id = 3;

-- PHẦN 2: TRUY VẤN
-- Lấy danh sách sinh viên hiện có
SELECT full_name, email, phone
FROM Student;
-- Phần 3: Câu hỏi phân loại (Hiểu về quan hệ)
delete from Course
where Course_id=101;