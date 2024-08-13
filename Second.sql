SHOW DATABASES;
USE TP1;
SHOW TABLES;

CREATE TABLE courses(
	CID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName varchar(50) NOT NULL,
    CourseDurationMonths INT NOT NULL,
    CourseFee INT NOT NULL
);
DESC courses;
SELECT * FROM courses;


-- Insert course details inside table named courses
-- 1. "The Complete Excel Mastery Course", 3, 1499
-- 2. "DSA for interview Preparation", 2, 4999
-- 3. "SQL BootCamp" , 1, 2999

INSERT INTO courses(CourseName, CourseDurationMonths, CourseFee) VALUES("The Complete Excel Mastery Course", 3, 1499);
INSERT INTO courses(CourseName, CourseDurationMonths, CourseFee) VALUES("DSA for interview Preparation", 2, 4999);
INSERT INTO courses(CourseName, CourseDurationMonths, CourseFee) VALUES("SQL Bootcamp", 1, 2999);

SELECT * FROM courses;
UPDATE courses SET CourseName="DSA for Interview Preparation" where CID = 2;


CREATE TABLE Learners(
    LID INT PRIMARY KEY AUTO_INCREMENT,
    Learner_firstName varchar(50) NOT NULL,
    Learner_lastName varchar(50) NOT NULL,
    Learner_Email varchar(50) UNIQUE KEY,
    Learner_PhoneNo varchar(50) NOT NULL,
    Learner_EnrollmentDate TIMESTAMP NOT NULL,
    Selected_Course INT NOT NULL,
    Years_of_Exp INT NOT NULL,
    Learner_Company varchar(50),
    Learner_SOJ varchar(50) NOT NULL,
    Batch_StartDate TIMESTAMP NOT NULL,
    Location varchar(50) NOT NULL,
    FOREIGN KEY(Selected_Course) REFERENCES courses(CID)
);
DESC Learners;
SELECT * FROM Learners;

-- Insert learner details into learner table
INSERT INTO Learners(Learner_firstName, Learner_lastName, Learner_Email, Learner_PhoneNo, Learner_EnrollmentDate, Selected_Course, 
	Years_of_Exp, Learner_Company, Learner_SOJ, Batch_StartDate, Location) 
    VALUES("Aryan", "Biswas", "aryanb198@gmail.com", "1234567890", "2024-03-22", "2", "2", "Frobada", "LinkedIN", "2024-03-25", "Pune");

INSERT INTO Learners(Learner_firstName, Learner_lastName, Learner_Email, Learner_PhoneNo, Learner_EnrollmentDate, Selected_Course, 
	Years_of_Exp, Learner_Company, Learner_SOJ, Batch_StartDate, Location) 
    VALUES("Nibbu", "Bhadwu", "bhadwu@gmail.com", "1234567890", "2024-03-16", "1", "2", "Bhadwu", "Instagram", "2024-03-25", "BhadwuLand");

INSERT INTO Learners(Learner_firstName, Learner_lastName, Learner_Email, Learner_PhoneNo, Learner_EnrollmentDate, Selected_Course, 
	Years_of_Exp, Learner_Company, Learner_SOJ, Batch_StartDate, Location) 
    VALUES("Tyson", "Blackie", "tysonblackie@gmail.com", "9999221200", "2024-04-28", "3", "1", "Sweetie", "Twitter", "2024-07-12", "India");

INSERT INTO Learners(Learner_firstName, Learner_lastName, Learner_Email, Learner_PhoneNo, Learner_EnrollmentDate, Selected_Course, 
	Years_of_Exp, Learner_Company, Learner_SOJ, Batch_StartDate, Location) 
    VALUES("Akash", "Mishra", "akash@gmail.com", "9999221200", "2024-01-21", "3", "1", "Sweetie", "Twitter", "2024-07-12", "India");

SELECT * FROM Learners;



-- DATA Analysis [Employee, Course, Learners]
SELECT * FROM employee;
-- 1. Give record of employee getting highest salary
DESC employee;
SELECT * FROM employee ORDER BY Salary DESC LIMIT 2;

-- 2. Give record of employee having highest salary and age > 25
SELECT * FROM Employee WHERE Age > 12 ORDER BY Salary DESC LIMIT 1;
-- OR
SELECT * FROM Employee WHERE Salary = (
	SELECT MAX(Salary) FROM Employee
);

SELECT MAX(Salary) FROM Employee;
SELECT MIN(Salary) FROM Employee;
SELECT MAX(Salary) as Max_Salary FROM Employee;


-- 3. Display number of enrollments in the website of table
SELECT COUNT(*) AS num_of_enrollments FROM Learners;


-- 4. Display the number of enrollments for the course ID = 3;
SELECT COUNT(*) AS Num_of_Enrollments FROM Learners WHERE Selected_Course = 1;


-- 5. Count No of learners enrolled in the month of Jan;
SELECT COUNT(*) AS Jan_Enrollments FROM Learners WHERE Learner_EnrollmentDate LIKE '%-01-%';
-- If we need for Date, we mention the date and % after it as the timestamp contains 00:00:00 after date
SELECT COUNT(*) AS Jan21_Enrollments FROM Learners WHERE Learner_EnrollmentDate like '%-01-21%';


-- 6. 
UPDATE Learners SET Years_of_Exp=2, Learner_Company="Amazon" WHERE LID=2;
SELECT * FROM Learners;


-- 7. Count Number of companies learners belong to
SELECT COUNT(Learner_Company) AS Learner_Company FROM Learners;
--  Unique count
SELECT COUNT(DISTINCT Learner_Company) AS Learner_Company FROM Learners;






