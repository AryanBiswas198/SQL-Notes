SHOW DATABASES;
USE TP1;
SHOW TABLES;

SELECT * FROM courses;
SELECT * FROM Learners;
SELECT * FROM employee;




--  1. Which courses have the highest enrollments rates?
SELECT Selected_Course, COUNT(*) AS Highest_Enrollment FROM Learners GROUP BY Selected_Course
ORDER BY Highest_Enrollment DESC LIMIT 1;


-- CourseId, Coursename and Enrollment Count
SELECT CID, Coursename, temp.No_of_Learners FROM courses JOIN
(SELECT Selected_Course, COUNT(*) AS No_of_Learners FROM Learners GROUP BY Selected_Course 
ORDER BY No_of_Learners DESC)
as temp ON courses.CID = temp.Selected_Course;




-- 2. How many learners are enrolled in each course?
SELECT Selected_Course, COUNT(*) AS No_of_Learners FROM Learners GROUP BY Selected_Course 
ORDER BY No_of_Learners DESC;











