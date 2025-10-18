
-- 1. Split the Name column by comma (,)

CREATE TABLE TestMultipleColumns(Id INT, Name NVARCHAR(50));
INSERT INTO TestMultipleColumns VALUES
(1,'Ali, Vali'),
(2,'Zokir, Akbar'),
(3,'Malika, Fotima');

SELECT 
    Id,
    LEFT(Name, CHARINDEX(',', Name) - 1) AS FirstName,
    LTRIM(RIGHT(Name, LEN(Name) - CHARINDEX(',', Name))) AS LastName
FROM TestMultipleColumns;


-- 2. Find strings that contain % sign

CREATE TABLE TestPercent(Id INT, Strs NVARCHAR(50));
INSERT INTO TestPercent VALUES
(1,'5% discount'),
(2,'Price'),
(3,'30% off'),
(4,'hello');

SELECT *
FROM TestPercent
WHERE Strs LIKE '%[%]%';


-- 3. Split by dot (.)

CREATE TABLE Splitter(Id INT, Vals NVARCHAR(50));
INSERT INTO Splitter VALUES
(1,'SQL.Server'),(2,'Chat.GPT'),(3,'Lesson.14');

SELECT 
    Id,
    LEFT(Vals, CHARINDEX('.', Vals) - 1) AS Part1,
    SUBSTRING(Vals, CHARINDEX('.', Vals) + 1, LEN(Vals)) AS Part2
FROM Splitter;


-- 4. Rows where string has more than 2 dots

CREATE TABLE testDots(Id INT, Vals NVARCHAR(50));
INSERT INTO testDots VALUES
(1,'A.B.C.D'),(2,'A.B'),(3,'A.B.C'),(4,'Test.Test');

SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;


-- 5. Count spaces in each text

CREATE TABLE CountSpaces(Id INT, texts NVARCHAR(100));
INSERT INTO CountSpaces VALUES
(1,'Hello world'),
(2,'Chat GPT lesson 14'),
(3,'SQL practice');

SELECT 
    texts,
    LEN(texts) - LEN(REPLACE(texts, ' ', '')) AS SpaceCount
FROM CountSpaces;


-- 6. Employees earning more than their manager

CREATE TABLE Employee(Id INT, Name NVARCHAR(50), Salary INT, ManagerId INT);
INSERT INTO Employee VALUES
(1,'Ali', 3000, NULL),
(2,'Vali', 3500, 1),
(3,'Karim', 2500, 2),
(4,'Sami', 4000, 1);

SELECT 
    e.Name AS Employee,
    e.Salary AS EmployeeSalary,
    m.Name AS Manager,
    m.Salary AS ManagerSalary
FROM Employee e
JOIN Employee m ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary;


-- 7. Employees with 10–15 years of service

CREATE TABLE Employees(
EMPLOYEE_ID INT,
FIRST_NAME NVARCHAR(50),
LAST_NAME NVARCHAR(50),
HIRE_DATE DATE
);
INSERT INTO Employees VALUES
(1,'Ali','Karimov','2010-05-10'),
(2,'Vali','Saidov','2015-04-02'),
(3,'Lola','Tursunova','2020-06-12');

SELECT 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS Years_of_Service
FROM Employees
WHERE DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 15;


-- 8. Weather temperature higher than previous day

CREATE TABLE Weather(Id INT, RecordDate DATE, Temperature INT);
INSERT INTO Weather VALUES
(1,'2023-10-01',25),
(2,'2023-10-02',27),
(3,'2023-10-03',26),
(4,'2023-10-04',30);

SELECT w1.Id, w1.RecordDate, w1.Temperature
FROM Weather w1
JOIN Weather w2 ON DATEDIFF(DAY, w2.RecordDate, w1.RecordDate) = 1
WHERE w1.Temperature > w2.Temperature;


-- 9. First login date per player

CREATE TABLE Activity(player_id INT, device_id INT, event_date DATE);
INSERT INTO Activity VALUES
(1,101,'2023-01-01'),
(1,102,'2023-01-03'),
(2,101,'2023-02-01'),
(2,103,'2023-02-05');

SELECT 
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;


-- 10. Return 3rd item from fruit list

CREATE TABLE fruits(fruit_list NVARCHAR(100));
INSERT INTO fruits VALUES('apple,banana,orange,grapes');

-- SQL Server 2022+
SELECT 
    value AS third_item
FROM STRING_SPLIT((SELECT fruit_list FROM fruits), ',', 1)
WHERE ordinal = 3;


-- 11. Employment stage

SELECT 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    CASE 
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 5 AND 10 THEN 'Mid-Level'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 20 THEN 'Senior'
        ELSE 'Veteran'
    END AS EmploymentStage
FROM Employees;


-- 12. Extract integer at start of string

CREATE TABLE GetIntegers(Id INT, Vals NVARCHAR(50));
INSERT INTO GetIntegers VALUES
(1,'98'),
(2,'111abc'),
(3,'Hero'),
(4,'21Avtaar'),
(5,'5Laila');

SELECT 
    Id,
    CASE 
        WHEN PATINDEX('%[0-9]%', Vals) = 1 
        THEN LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'X') - 1)
        ELSE NULL 
    END AS IntegerValue
FROM GetIntegers;


-- 13. Swap first two letters of comma-separated words

CREATE TABLE MultipleVals(Id INT, Vals NVARCHAR(100));
INSERT INTO MultipleVals VALUES
(1,'abc,def,ghi'),
(2,'mn,op,qr');

SELECT 
    Id,
    STRING_AGG(
        SUBSTRING(value, 2, 1) + SUBSTRING(value, 1, 1) + SUBSTRING(value, 3, LEN(value)),
        ','
    ) AS SwappedVals
FROM MultipleVals
CROSS APPLY STRING_SPLIT(Vals, ',')
GROUP BY Id;


-- 14. Convert string characters into separate rows

DECLARE @txt NVARCHAR(50) = 'sdgfhsdgfhs@121313131';

WITH Numbers AS (
    SELECT TOP (LEN(@txt)) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects
)
SELECT SUBSTRING(@txt, n, 1) AS Character
FROM Numbers;


-- 15. First device logged in for each player

SELECT 
    a.player_id,
    a.device_id
FROM Activity a
WHERE event_date = (
    SELECT MIN(event_date)
    FROM Activity b
    WHERE a.player_id = b.player_id
);


-- 16. Separate integer and character values

DECLARE @mix NVARCHAR(100) = 'rtcfvty34redt';

SELECT
    LEFT(@mix, PATINDEX('%[0-9]%', @mix + 'x') - 1) AS CharsOnly,
    SUBSTRING(@mix, PATINDEX('%[0-9]%', @mix), LEN(@mix)) AS NumbersOnly;
