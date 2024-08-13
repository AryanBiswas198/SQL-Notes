SHOW DATABASES;
USE TP1;
SHOW TABLES;

SELECT * FROM Learners;
SELECT * FROM Employee;

INSERT INTO employee(Firstname, Lastname, Age, Salary, Location) VALUES ("Alex", "Jones", 23, 130000, "Delhi");
INSERT INTO employee(Firstname, Lastname, Age, Salary, Location) VALUES ("Cheery", "Blossom", 21, 45000, "Kolkata");
INSERT INTO employee(Firstname, Lastname, Age, Salary, Location) VALUES ("Vik", "Kronos", 24, 230000, "Delhi");



-- For Each location, what is the count of each Employee corresponding to the location and average salary of 
-- those employees in that location
SELECT Location, COUNT(*) AS Emp_Count, AVG(Salary) AS Avg_Salary FROM employee GROUP BY Location;


-- Now, same question as above but also display Firstname and lastname corresponding to the record;
-- Brute Force -- ANSWER IS WRONG
SELECT Location, Firstname, Lastname, COUNT(*) AS Emp_Count, AVG(Salary) AS Avg_Salary FROM employee GROUP BY Location, Firstname, Lastname;


-- Correct Answer
SELECT Firstname, Lastname, employee.Location, Emp_Count, Avg_Salary FROM employee
JOIN 
(SELECT Location, COUNT(*) AS Emp_Count, AVG(Salary) AS Avg_Salary FROM employee  GROUP BY Location) AS temp
ON employee.Location = temp.Location;


-- Optimise above queries using window queries
SELECT Firstname, Lastname, Location, COUNT(Location) OVER (PARTITION BY Location) AS Emp_Count, 
AVG(Salary) OVER (PARTITION BY Location) AS Avg_Salary FROM employee;
-- helps to display non-aggregated columns



INSERT INTO employee(Firstname, Lastname, Age, Salary, Location) VALUES ("Jeevan", "Hedge", 27, 200000, "Noida");
INSERT INTO employee(Firstname, Lastname, Age, Salary, Location) VALUES ("Sidish", "Kumar", 25, 200000, "Bengaluru");
SELECT * FROM employee;


-- Create a seperate Row Priority_EMP on the basis of Salary of employee
-- Using ROW_NUMBER()
-- Sorts on the basis of salary and if there is same value, it sorts on the basis of it's PrimaryKey
SELECT Firstname, Lastname, Salary, ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS Priority_Emp FROM Employee;



-- Using Rank() Function
-- 	Sorts like the above except if there is same value, it will rank it same and skip the values which were counted as rank previously
SELECT Firstname, Lastname, Salary, RANK() OVER (ORDER BY Salary DESC) AS Priority_Emp FROM Employee;



-- Using DENSE_RANK() function
-- SORTS like the above except if there is same value, it will rank and not skip the previous values
SELECT Firstname, Lastname, Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS Priority_Emp FROM Employee;




-- Give report of all employee having 2nd highest salary
SELECT * FROM
(SELECT Firstname, Lastname, Salary, Location, DENSE_RANK() OVER (ORDER BY Salary DESC) AS Priority_Rank FROM employee)
AS TEMP WHERE Priority_Rank = 2;

-- Give report of the first employee having 2nd Highest salary
SELECT * FROM 
(SELECT Firstname, Lastname, Salary, Location, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS Priority_Rank FROM employee)
AS TEMP WHERE Priority_Rank = 2;



-- Write a query to specify details of highest salary people in each location
SELECT * FROM employee;

SELECT * FROM
(SELECT Firstname, Lastname, Salary, Location, 
ROW_NUMBER() OVER (PARTITION BY Location ORDER BY Salary DESC) As Priority_Rank FROM employee) AS temp
WHERE Priority_Rank = 1;











SELECT * FROM Learners;
 
-- DATA ANALYSIS QUESTIONS
-- 1. Which courses have the highest enrollment rates


-- 2. How many learners are enrolled in each course
SELECT Selected_Course, COUNT(Selected_Course) AS Learner_Count FROM Learners GROUP BY Selected_Course;


-- 3. What is the total revenue generated from course fees
SELECT Selected_Course, SUM(








