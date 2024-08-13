SHOW DATABASES;
USE TP1;
SHOW TABLES;

SELECT * FROM Learners;
SELECT * FROM courses;

-- Aggregation Operators
-- Count the number of students who joined the course via Different Companies
SELECT Learner_SOJ, COUNT(*) AS Different_Companies FROM Learners GROUP BY Learner_SOJ;

-- Grouping Via Source Of Joining and Location
SELECT Learner_SOJ, Location, COUNT(*) AS Different_Companies FROM Learners GROUP BY Learner_SOJ, Location;

-- Corresponding to each Course how many students have enrolled
SELECT Selected_Course, COUNT(*) AS Selected_CourseBy_Students FROM Learners GROUP BY Selected_Course;

-- Corresponding to individual source of Joining, give the maximum years of experience
SELECT Learner_SOJ, Max(Years_of_Exp) AS Max_Exp FROM Learners GROUP BY Learner_SOJ;

-- Corresponding to individual source of Joining, give the minimum years of experience
SELECT Learner_SOJ, MIN(Years_of_Exp) AS Min_Exp FROM Learners GROUP BY Learner_SOJ;

-- Corresponding to individual source of Joining, give the average years of experience
SELECT Learner_SOJ, AVG(Years_of_Exp) AS Avg_Exp FROM Learners GROUP BY Learner_SOJ;

-- Corresponding to individual source of Joining, give the summation years of experience
SELECT Learner_SOJ, SUM(Years_of_Exp) AS Sum_Exp FROM Learners GROUP BY Learner_SOJ;


-- When we have to filter data on Aggregation Methods, Instead of using WHERE Clause, 
-- We use HAVING Clause or Keyword after GROUP BY.

-- Display the report of learners who have joined the course via more than 1 source of joining
SELECT Learner_SOJ, COUNT(*) AS More_Than_1SOJ FROM Learners GROUP BY Learner_SOJ HAVING More_Than_1SOJ > 2;


-- INSERT two more enrollments in learner table 
INSERT INTO Learners(Learner_firstName, Learner_lastName, Learner_Email, Learner_PhoneNo, Learner_EnrollmentDate, Selected_Course, 
	Years_of_Exp, Learner_Company, Learner_SOJ, Batch_StartDate, Location) 
    VALUES("Sidhish", "Kumar", "siddish@gmail.com", "1111222222", "2024-01-21", "2", "4", "Amazon", "LinkedIN", "2024-03-25", "Gurugram");

INSERT INTO Learners(Learner_firstName, Learner_lastName, Learner_Email, Learner_PhoneNo, Learner_EnrollmentDate, Selected_Course, 
	Years_of_Exp, Learner_Company, Learner_SOJ, Batch_StartDate, Location) 
    VALUES("Kaneesha", "Mishra", "kaneesha@gmail.com", "8888253627", "2024-01-21", "2", "5", "Google", "LinkedIN", "2024-03-25", "Bengaluru");
    
    INSERT INTO Learners(Learner_firstName, Learner_lastName, Learner_Email, Learner_PhoneNo, Learner_EnrollmentDate, Selected_Course, 
	Years_of_Exp, Learner_Company, Learner_SOJ, Batch_StartDate, Location) 
    VALUES("Alex", "Johnes", "alex@gmail.com", "1253738292", "2024-02-14", "2", "3", "Facebook", "YouTube", "2024-03-25", "Mumbai");


-- Display The count of those Students who Joined VIA Linkedin
SELECT Learner_SOJ, COUNT(*) As Linkedin_SOJ FROM Learners GROUP BY Learner_SOJ HAVING Learner_SOJ = 'LinkedIN';



-- Display Course Which doesnot include Excel
SELECT * FROM courses WHERE CourseName NOT LIKE '%Excel%';



-- AND OR NOT BETWEEN KEYWORDS EXAMPLES
-- Display the reports of those students who have less than 4 years of exp AND source of joining is youTube AND Location.
SELECT * FROM Learners WHERE Years_of_Exp < 4 AND Learner_SOJ = 'Youtube' AND Location = 'Mumbai';

-- Display records of thos estudents with YearsofEXP is between 1-3 Years 
SELECT * FROM Learners WHERE Years_of_Exp >= 1 AND Years_of_Exp <= 3;
-- OR
SELECT * FROM Learners WHERE Years_of_Exp BETWEEN 1 AND 3;


-- Display the reports of those students who have less than 4 years of exp OR source of joining is youTube OR Location.
SELECT * FROM Learners WHERE Years_of_Exp < 4 OR Learner_SOJ = 'Youtube' OR Location = 'Chennai';



-- ALTER Command in SQL
DESC employee;

-- to add a new column in an exisiting table, instead of recreating table, we use ALTER Command
ALTER TABLE employee ADD column JobPosition varchar(50);

-- to modify a column
ALTER TABLE employee MODIFY column Firstname varchar(40) NOT NULL;

-- To drop a column from a table
ALTER TABLE employee DROP column JobPosting;



-- Truncate in SQL
-- Research Diff between Deletion VS Truncate Command in SQL !!


-- Datatypes in SQL -> Decimal
CREATE TABLE Course_Update(
	CID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName varchar(50) NOT NULL,
    CourseDurationMonths DECIMAL(3,1) NOT NULL,
    CourseFee INT NOT NULL,
    Changed_AT TIMESTAMP DEFAULT now() ON UPDATE now() -- Updating it this way
);

INSERT INTO Course_Update(CourseName, CourseDurationMonths, CourseFee) VALUES("The Complete Excel Mastery Course", 3.3, 1499);
INSERT INTO Course_Update(CourseName, CourseDurationMonths, CourseFee) VALUES("DSA for interview Preparation", 2.9, 4999);
INSERT INTO Course_Update(CourseName, CourseDurationMonths, CourseFee) VALUES("SQL Bootcamp", 1.6, 2999);

SELECT * FROM Course_Update;
SHOW TABLES;
DROP TABLE Course_Update;

ALTER TABLE Course_Update MODIFY column CourseFee DECIMAL(10,3) NOT NULL;
SELECT * FROM Course_update;
-- Update CourseFee of SQL Bootcamp to 3999
UPDATE Course_Update SET CourseFee = 1999 WHERE CID=3;

-- Updating schema like this 
ALTER TABLE Course_Update MODIFY column Changed_AT TIMESTAMP DEFAULT NOW() ON UPDATE now();



SELECT * FROM courses;
SELECT * FROM Learners;