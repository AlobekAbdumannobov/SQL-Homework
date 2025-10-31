--create database SQL_Practice12
--go
--use SQL_Practice12
--1

--Create table Person (personId int, firstName varchar(255), lastName varchar(255))
--Create table Address (addressId int, personId int, city varchar(255), state varchar(255))
--Truncate table Person
--insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
--insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
--Truncate table Address
--insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
--insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

--1. Combine Two Tables (Left Join)
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;

--2  database

--Create table Employee (id int, name varchar(255), salary int, managerId int)
--Truncate table Employee
--insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
--insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
--insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
--insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

--2. Employees Earning More Than Their Managers (Self Join)
select e.name as Employee
from employee e
left join employee e2 on e.managerId = e2.Id
where e.salary > e2.salary;

--3. Duplicate Emails (GROUP BY + HAVING)
--drop table person 
--Create table Person (id int, email varchar(255)) 
--insert into Person (id, email) values ('1', 'a@b.com') 
--insert into Person (id, email) values ('2', 'c@d.com') 
--insert into Person (id, email) values ('3', 'a@b.com')

select email, count(*) from Person
group by email
having count(*) > 1;

--4. Delete Duplicate Emails (DELETE with CTE)

--CREATE TABLE Users (
--    id INT PRIMARY KEY,
--    email NVARCHAR(255) NOT NULL
--);

--INSERT INTO Users (id, email) VALUES
--(1, 'john@example.com'),
--(2, 'bob@example.com'),
--(3, 'john@example.com');

WITH Ranked AS (
    SELECT id, 
           ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM users
)
DELETE FROM Ranked WHERE rn > 1;

--SELECT id, email,
--           ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
--    FROM users
--	order by id asc

--5. Find parents who have only girls (UNION ALL + NOT EXISTS)

--CREATE TABLE boys (
--    Id INT PRIMARY KEY,
--    name VARCHAR(100),
--    ParentName VARCHAR(100)
--);

--CREATE TABLE girls (
--    Id INT PRIMARY KEY,
--    name VARCHAR(100),
--    ParentName VARCHAR(100)
--);

--INSERT INTO boys (Id, name, ParentName) 
--VALUES 
--(1, 'John', 'Michael'),  
--(2, 'David', 'James'),   
--(3, 'Alex', 'Robert'),   
--(4, 'Luke', 'Michael'),  
--(5, 'Ethan', 'David'),    
--(6, 'Mason', 'George');  


--INSERT INTO girls (Id, name, ParentName) 
--VALUES 
--(1, 'Emma', 'Mike'),  
--(2, 'Olivia', 'James'),  
--(3, 'Ava', 'Robert'),    
--(4, 'Sophia', 'Mike'),  
--(5, 'Mia', 'John'),      
--(6, 'Isabella', 'Emily'),
--(7, 'Charlotte', 'George');

SELECT DISTINCT g.ParentName
FROM girls g
LEFT JOIN boys b ON g.ParentName = b.ParentName
WHERE b.ParentName IS NULL
AND g.ParentName IS NOT NULL; 


SELECT 
    custid,
    SUM(val) AS total_sales_over_50,
    MIN(weight) AS least_weight
FROM TSQL2012.Sales.Orders
WHERE weight > 50
GROUP BY custid;

--7 Carts – Full Outer Join with COALESCE

--DROP TABLE IF EXISTS Cart1;
--DROP TABLE IF EXISTS Cart2;
--GO

--CREATE TABLE Cart1
--(
--Item  VARCHAR(100) PRIMARY KEY
--);
--GO

--CREATE TABLE Cart2
--(
--Item  VARCHAR(100) PRIMARY KEY
--);
--GO

--INSERT INTO Cart1 (Item) VALUES
--('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
--GO

--INSERT INTO Cart2 (Item) VALUES
--('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
--GO

SELECT 
    c1.Item AS [Item Cart 1],
    c2.Item AS [Item Cart 2]
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2 ON c1.Item = c2.Item
ORDER BY COALESCE(c1.Item, c2.Item);

--8. Customers Who Never Order (LEFT JOIN + IS NULL)
--sqlSELECT c.name AS Customers
--FROM Customers c
--LEFT JOIN Orders o ON c.id = o.customerId
--WHERE o.customerId IS NULL;

--Create table Customers (id int, name varchar(255))
--Create table Orders (id int, customerId int)
--Truncate table Customers
--insert into Customers (id, name) values ('1', 'Joe')
--insert into Customers (id, name) values ('2', 'Henry')
--insert into Customers (id, name) values ('3', 'Sam')
--insert into Customers (id, name) values ('4', 'Max')
--Truncate table Orders
--insert into Orders (id, customerId) values ('1', '3')
--insert into Orders (id, customerId) values ('2', '1')

select c.name from customers c
full outer join orders o 
on c.id = o.id
where customerId is null

--9
--Create table Students (student_id int, student_name varchar(20))
--Create table Subjects (subject_name varchar(20))
--Create table Examinations (student_id int, subject_name varchar(20))
--Truncate table Students
--insert into Students (student_id, student_name) values ('1', 'Alice')
--insert into Students (student_id, student_name) values ('2', 'Bob')
--insert into Students (student_id, student_name) values ('13', 'John')
--insert into Students (student_id, student_name) values ('6', 'Alex')
--Truncate table Subjects
--insert into Subjects (subject_name) values ('Math')
--insert into Subjects (subject_name) values ('Physics')
--insert into Subjects (subject_name) values ('Programming')
--Truncate table Examinations
--insert into Examinations (student_id, subject_name) values ('1', 'Math')
--insert into Examinations (student_id, subject_name) values ('1', 'Physics')
--insert into Examinations (student_id, subject_name) values ('1', 'Programming')
--insert into Examinations (student_id, subject_name) values ('2', 'Programming')
--insert into Examinations (student_id, subject_name) values ('1', 'Physics')
--insert into Examinations (student_id, subject_name) values ('1', 'Math')
--insert into Examinations (student_id, subject_name) values ('13', 'Math')
--insert into Examinations (student_id, subject_name) values ('13', 'Programming')
--insert into Examinations (student_id, subject_name) values ('13', 'Physics')
--insert into Examinations (student_id, subject_name) values ('2', 'Math')
--insert into Examinations (student_id, subject_name) values ('1', 'Math')

--9. Students and Examinations (CROSS JOIN + LEFT JOIN + COUNT)
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    ISNULL(COUNT(e.subject_name), 0) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e 
    ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
