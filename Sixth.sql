SHOW DATABASES;
USE TP1;
SHOW TABLES;

SELECT * FROM courses;

-- Case Statements in SQL
-- Create a new column named as CourseFeeStatus 
-- CourseFee > 3999 - Expensive
-- CourseFee > 1499 - Moderate
-- ELSE -> Cheap Course

SELECT CID, CourseName, CourseFee, 
CASE
	WHEN CourseFee > 3999 THEN 'Course Is Expensive'
    WHEN CourseFee > 1499 THEN 'Course Is Moderate'
    ELSE 'Course is Cheap'
END AS CourseFeeStatus
FROM courses;



-- Case Expressions in SQL
-- CourseType : Premium, Plus and Regular Course
SELECT CID, CourseName, CourseFee,
	CASE CourseFee
		WHEN 4999 THEN 'Premium Course'
        WHEN 3999 THEN 'Plus Course'
        ELSE 'Regular Course'
	END AS CourseType
FROM courses;




-- Create a new Table Named Orders in databse
CREATE TABLE orders(
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
    Order_Date TIMESTAMP NOT NULL,
    Order_Learner_Id INT NOT NULL,
    OrderStatus varchar(50) NOT NULL,
    FOREIGN KEY(Order_Learner_Id) REFERENCES Learners(LID)
);


DESC Orders;
DESC learners;
SELECT * FROM Learners;

-- Insertion of reports inside Orders table
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-21',1,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',6,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-02-22',3,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-15',4,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',5,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-16',7,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-22',1,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',5,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-25',1,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-11',7,'CLOSED');


SELECT * FROM Orders;
SELECT * FROM LEARNERS;


-- Total orders per student
-- Order_Learner_Id.       Total_Orders
SELECT Order_Learner_Id, COUNT(*) As Total_Orders FROM Orders GROUP BY Order_Learner_Id;


-- Order_Learner_Id.  Learner_Firstname.   Learner_Lastname      Total_Orders
SELECT temp.Order_Learner_Id, Learner_Firstname, Learner_Lastname, temp.Total_Orders FROM Learners
JOIN
(SELECT Order_Learner_Id, COUNT(*) As Total_Orders FROM Orders GROUP BY Order_Learner_Id) 
AS temp ON Learners.LID = temp.Order_Learner_Id;



-- Create Fifth Column.
-- Order_Learner_Id.  Learner_Firstname.   Learner_Lastname    Total_Orders.    Avg_Orders
SELECT temp.Order_Learner_Id, Learner_Firstname, Learner_Lastname, temp.Total_Orders, AVG(SUM(temp.Total_Orders)) OVER() AS Avg_Orders FROM Learners
JOIN
(SELECT Order_Learner_Id, COUNT(*) As Total_Orders FROM Orders GROUP BY Order_Learner_Id) 
AS temp ON Learners.LID = temp.Order_Learner_Id;

-- UPPER QUERY CAN BE WRONG








