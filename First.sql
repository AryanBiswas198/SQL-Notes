SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS TP1;
USE TP1;
SELECT database();

CREATE TABLE employee (
    EID  INT PRIMARY KEY AUTO_INCREMENT,
    Firstname    varchar(50) NOT NULL,
    Lastname     varchar(50) NOT NULL,
    Age 		 INT NOT NULL,
    Salary		 INT NOT NULL,
    Location	 varchar(50) NOT NULL
);

SHOW TABLES;
DESC employee;
DROP TABLE employee;

-- This is a single line comment
INSERT INTO employee VALUES (1, "Bhadwu", "Nibbu", 21, 999999999, "BhadwuLand");
INSERT INTO employee(Firstname, Lastname, Age, Salary, Location) VALUES ("Nibbu", "Boobooo", 17, 99999, "Bhadwuland");
INSERT INTO employee(Firstname, Lastname, Age, Salary, Location) VALUES ("Tyson", "BoooboooBoi", 11, 100000, "Bhadwuland");
INSERT INTO employee(Firstname, Lastname, Age, Salary, Location) VALUES ("Blackiee", "Sweeetieee", 7, 450000, "Bhadwuland");

SELECT * FROM employee;

-- Give details of employees having salary more than 100000
SELECT * FROM employee WHERE Salary > 100000;
SELECT Firstname, Lastname, EID FROM employee WHERE Salary > 100000;

-- Give records of employees with age more than 11;
SELECT * FROM employee WHERE Age > 11;

-- Update LastName of EID = 1
UPDATE employee SET Lastname="Nibbu" WHERE EID=1;


-- Delete the record of EID = 5
DELETE FROM employee WHERE EID = 5;


















