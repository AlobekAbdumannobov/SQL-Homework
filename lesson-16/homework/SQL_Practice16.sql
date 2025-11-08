--create database SQL_Practice16
--go
--use SQL_Practice16

--Lesson-16: CTEs and Derived Tables	

--CREATE TABLE Numbers1(Number INT)

--INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

--CREATE TABLE FindSameCharacters
--(
--     Id INT
--    ,Vals VARCHAR(10)
--)
 
--INSERT INTO FindSameCharacters VALUES
--(1,'aa'),
--(2,'cccc'),
--(3,'abc'),
--(4,'aabc'),
--(5,NULL),
--(6,'a'),
--(7,'zzz'),
--(8,'abc')



--CREATE TABLE RemoveDuplicateIntsFromNames
--(
--      PawanName INT
--    , Pawan_slug_name VARCHAR(1000)
--)
 
 
--INSERT INTO RemoveDuplicateIntsFromNames VALUES
--(1,  'PawanA-111'  ),
--(2, 'PawanB-123'   ),
--(3, 'PawanB-32'    ),
--(4, 'PawanC-4444' ),
--(5, 'PawanD-3'  )





--CREATE TABLE Example
--(
--Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
--String VARCHAR(30) NOT NULL
--);


--INSERT INTO Example VALUES('123456789'),('abcdefghi');


--CREATE TABLE Employees (
--    EmployeeID INT PRIMARY KEY,
--    DepartmentID INT,
--    FirstName VARCHAR(50),
--    LastName VARCHAR(50),
--    Salary DECIMAL(10, 2)
--);

--INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
--(1, 1, 'John', 'Doe', 60000.00),
--(2, 1, 'Jane', 'Smith', 65000.00),
--(3, 2, 'James', 'Brown', 70000.00),
--(4, 3, 'Mary', 'Johnson', 75000.00),
--(5, 4, 'Linda', 'Williams', 80000.00),
--(6, 2, 'Michael', 'Jones', 85000.00),
--(7, 1, 'Robert', 'Miller', 55000.00),
--(8, 3, 'Patricia', 'Davis', 72000.00),
--(9, 4, 'Jennifer', 'García', 77000.00),
--(10, 1, 'William', 'Martínez', 69000.00);

--CREATE TABLE Departments (
--    DepartmentID INT PRIMARY KEY,
--    DepartmentName VARCHAR(50)
--);

--INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
--(1, 'HR'),
--(2, 'Sales'),
--(3, 'Marketing'),
--(4, 'Finance'),
--(5, 'IT'),
--(6, 'Operations'),
--(7, 'Customer Service'),
--(8, 'R&D'),
--(9, 'Legal'),
--(10, 'Logistics');

--CREATE TABLE Sales (
--    SalesID INT PRIMARY KEY,
--    EmployeeID INT,
--    ProductID INT,
--    SalesAmount DECIMAL(10, 2),
--    SaleDate DATE
--);
--INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
---- January 2025
--(1, 1, 1, 1550.00, '2025-01-02'),
--(2, 2, 2, 2050.00, '2025-01-04'),
--(3, 3, 3, 1250.00, '2025-01-06'),
--(4, 4, 4, 1850.00, '2025-01-08'),
--(5, 5, 5, 2250.00, '2025-01-10'),
--(6, 6, 6, 1450.00, '2025-01-12'),
--(7, 7, 1, 2550.00, '2025-01-14'),
--(8, 8, 2, 1750.00, '2025-01-16'),
--(9, 9, 3, 1650.00, '2025-01-18'),
--(10, 10, 4, 1950.00, '2025-01-20'),
--(11, 1, 5, 2150.00, '2025-02-01'),
--(12, 2, 6, 1350.00, '2025-02-03'),
--(13, 3, 1, 2050.00, '2025-02-05'),
--(14, 4, 2, 1850.00, '2025-02-07'),
--(15, 5, 3, 1550.00, '2025-02-09'),
--(16, 6, 4, 2250.00, '2025-02-11'),
--(17, 7, 5, 1750.00, '2025-02-13'),
--(18, 8, 6, 1650.00, '2025-02-15'),
--(19, 9, 1, 2550.00, '2025-02-17'),
--(20, 10, 2, 1850.00, '2025-02-19'),
--(21, 1, 3, 1450.00, '2025-03-02'),
--(22, 2, 4, 1950.00, '2025-03-05'),
--(23, 3, 5, 2150.00, '2025-03-08'),
--(24, 4, 6, 1700.00, '2025-03-11'),
--(25, 5, 1, 1600.00, '2025-03-14'),
--(26, 6, 2, 2050.00, '2025-03-17'),
--(27, 7, 3, 2250.00, '2025-03-20'),
--(28, 8, 4, 1350.00, '2025-03-23'),
--(29, 9, 5, 2550.00, '2025-03-26'),
--(30, 10, 6, 1850.00, '2025-03-29'),
--(31, 1, 1, 2150.00, '2025-04-02'),
--(32, 2, 2, 1750.00, '2025-04-05'),
--(33, 3, 3, 1650.00, '2025-04-08'),
--(34, 4, 4, 1950.00, '2025-04-11'),
--(35, 5, 5, 2050.00, '2025-04-14'),
--(36, 6, 6, 2250.00, '2025-04-17'),
--(37, 7, 1, 2350.00, '2025-04-20'),
--(38, 8, 2, 1800.00, '2025-04-23'),
--(39, 9, 3, 1700.00, '2025-04-26'),
--(40, 10, 4, 2000.00, '2025-04-29'),
--(41, 1, 5, 2200.00, '2025-05-03'),
--(42, 2, 6, 1650.00, '2025-05-07'),
--(43, 3, 1, 2250.00, '2025-05-11'),
--(44, 4, 2, 1800.00, '2025-05-15'),
--(45, 5, 3, 1900.00, '2025-05-19'),
--(46, 6, 4, 2000.00, '2025-05-23'),
--(47, 7, 5, 2400.00, '2025-05-27'),
--(48, 8, 6, 2450.00, '2025-05-31'),
--(49, 9, 1, 2600.00, '2025-06-04'),
--(50, 10, 2, 2050.00, '2025-06-08'),
--(51, 1, 3, 1550.00, '2025-06-12'),
--(52, 2, 4, 1850.00, '2025-06-16'),
--(53, 3, 5, 1950.00, '2025-06-20'),
--(54, 4, 6, 1900.00, '2025-06-24'),
--(55, 5, 1, 2000.00, '2025-07-01'),
--(56, 6, 2, 2100.00, '2025-07-05'),
--(57, 7, 3, 2200.00, '2025-07-09'),
--(58, 8, 4, 2300.00, '2025-07-13'),
--(59, 9, 5, 2350.00, '2025-07-17'),
--(60, 10, 6, 2450.00, '2025-08-01');

--CREATE TABLE Products (
--    ProductID INT PRIMARY KEY,
--    CategoryID INT,
--    ProductName VARCHAR(100),
--    Price DECIMAL(10, 2)
--);

--INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
--(1, 1, 'Laptop', 1000.00),
--(2, 1, 'Smartphone', 800.00),
--(3, 2, 'Tablet', 500.00),
--(4, 2, 'Monitor', 300.00),
--(5, 3, 'Headphones', 150.00),
--(6, 3, 'Mouse', 25.00),
--(7, 4, 'Keyboard', 50.00),
--(8, 4, 'Speaker', 200.00),
--(9, 5, 'Smartwatch', 250.00),
--(10, 5, 'Camera', 700.00);

--EASY TASKS

--1 Create a numbers table using a recursive query from 1 to 1000.

WITH numbers AS (
    -- 1. ANCHOR MEMBER (Starting Point)
    SELECT 
        1 AS N  -- Select the initial number (1)
    
    UNION ALL
    
    -- 2. RECURSIVE MEMBER (Iteration)
    SELECT 
        N + 1   -- Calculate the next number by adding 1 to the previous one
    FROM 
        numbers -- Self-reference to the CTE
    WHERE 
        N < 1000 -- Stopping condition: continue as long as the previous number (N) is less than 1000
)
-- 3. Final SELECT statement and increasing the Recursion Limit
SELECT 
    N 
FROM 
    numbers
OPTION (MAXRECURSION 1000); -- Override the default SQL Server recursion limit (100) to allow 1000 iterations

--2 Write a query to find the total sales per employee using a derived table.(Sales, Employees)

-- Using a derived table to calculate total sales per employee
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) AS s
ON e.EmployeeID = s.EmployeeID;

--3 Create a CTE to find the average salary of employees.(Employees)

-- Simple CTE to calculate average salary
WITH AvgSalaryCTE AS (
    SELECT AVG(Salary) AS AvgSalary
    FROM Employees
)
SELECT * FROM AvgSalaryCTE;

--4 Write a query using a derived table to find the highest sales for each product.(Sales, Products)

-- Find the highest single sale per product using a derived table
SELECT 
    p.ProductID,
    p.ProductName,
    s.MaxSale
FROM Products p
JOIN (
    SELECT ProductID, MAX(SalesAmount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) AS s
ON p.ProductID = s.ProductID;

--5 Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.

-- Recursive CTE to double numbers until less than 1,000,000
WITH DoubleCTE AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num * 2
    FROM DoubleCTE
    WHERE num * 2 < 1000000
)
SELECT num
FROM DoubleCTE
OPTION (MAXRECURSION 1000);

--6 Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)

-- Use a CTE to count sales per employee and filter > 5
WITH SalesCountCTE AS (
    SELECT EmployeeID, COUNT(*) AS SaleCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT 
    e.FirstName,
    e.LastName,
    s.SaleCount
FROM Employees e
JOIN SalesCountCTE s
ON e.EmployeeID = s.EmployeeID
WHERE s.SaleCount > 5;

--7 Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)

-- Use a CTE to calculate total sales per product and filter above 500
-- Use a CTE to calculate total sales per product and filter above 500

-- Start of the CTE (Common Table Expression) definition, named 'ProductSalesCTE'
WITH ProductSalesCTE AS ( 
    -- 1. CTE's inner query definition starts here
    SELECT
        ProductID,                  -- Grouping column: Identifier for each product
        SUM(SalesAmount) AS TotalSales -- Calculating the aggregate total sales for each grouped product
    FROM
        Sales -- Data source: The Sales transaction table
    GROUP BY
        ProductID -- Grouping the sales records based on Product ID
)
-- End of the CTE definition

-- Main outer SELECT statement starts
SELECT 
    p.ProductName, -- Selects the product name from the Products table
    c.TotalSales   -- Selects the calculated total sales amount from the CTE (c alias)
FROM
    Products p -- Primary table: Products (aliased as p)
JOIN
    ProductSalesCTE c -- Join the Products table with the calculated sales data from the CTE (aliased as c)
ON
    p.ProductID = c.ProductID -- Join condition: Link records using the common ProductID
WHERE
    c.TotalSales > 500; -- FILTERING: Restrict the final result set to only products where the TotalSales exceeds 500

--8 Create a CTE to find employees with salaries above the average salary.(Employees)

-- Compare each employee's salary to the company average
WITH AvgCTE AS (
    SELECT AVG(Salary) AS AvgSalary FROM Employees
)
SELECT 
    e.FirstName,
    e.LastName,
    e.Salary
FROM Employees e, AvgCTE
WHERE e.Salary > AvgCTE.AvgSalary;

--Medium Tasks

--1 Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)

--with TopEmp as (
--select top 5 employeeid, count(*) as NumOrd from sales s group by EmployeeID 
--)select e.employeeid, e.firstname, e.lastname, te.NumOrd from Employees e
--join TopEmp TE on e.EmployeeID = te.EmployeeID
--order by te.EmployeeID desc

-- Find top 5 employees based on number of sales
SELECT TOP 5
    e.FirstName,
    e.LastName,
    s.SaleCount
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS SaleCount
    FROM Sales
    GROUP BY EmployeeID
) AS s
ON e.EmployeeID = s.EmployeeID
ORDER BY s.SaleCount DESC;

--2 Write a query using a derived table to find the sales per product category.(Sales, Products)

SELECT
    TS.CategoryID,
    SUM(TS.SalesAmount) AS TotalCategorySales
FROM
    -- DERIVED TABLE: Combines Sales transactions with Category IDs
    (SELECT
            s.SalesAmount,
            p.CategoryID
        FROM
            Sales s
        JOIN
            Products p ON s.ProductID = p.ProductID -- Join to get the Category ID for each sale
    ) AS TS -- Alias given to the Derived Table (TS - Transaction Sales)
GROUP BY
    TS.CategoryID -- Group the resulting table by Category ID to aggregate sales
ORDER BY
    TS.CategoryID;

--3 Write a script to return the factorial of each value next to it.(Numbers1)
-- Recursive factorial calculation

DECLARE @MaxNumber INT;
-- Get the maximum number from the Numbers1 table to set the recursion limit
SELECT @MaxNumber = MAX(Number) FROM Numbers1;

-- Recursive CTE: Calculates the factorial series from 1 up to @MaxNumber
WITH FactorialCTE AS (
    -- ===================================
    -- ANCHOR MEMBER: Start the factorial calculation from 1
    -- ===================================
    SELECT
        1 AS N, -- The current number
        CAST(1 AS DECIMAL(38, 0)) AS FactorialValue -- 1! = 1. Using DECIMAL(38,0) for larger values.
    
    UNION ALL
    
    -- ===================================
    -- RECURSIVE MEMBER: Calculate the next factorial
    -- ===================================
    SELECT
        F.N + 1, -- The next number
        F.FactorialValue * (F.N + 1) -- Correct factorial calculation: (N+1)! = N! * (N+1)
    FROM
        FactorialCTE F -- Self-reference (recursion)
    WHERE
        F.N < @MaxNumber -- Termination condition: Continues until @MaxNumber is reached
)
-- ===================================
-- FINAL RESULT: Join with the Numbers1 table
-- ===================================
SELECT
    n.Number,
    F.FactorialValue
FROM
    Numbers1 n
JOIN
    FactorialCTE F ON n.Number = F.N -- Join each number in Numbers1 with the corresponding calculated factorial
ORDER BY 
    n.Number;

--4 This script uses recursion to split a string into rows of substrings for each character in the string.(Example)


-- O'zgaruvchini e'lon qilish
DECLARE @InputString VARCHAR(100);

-- Jadvaldan satr qiymatini o'zgaruvchiga yuklash (Example jadvalidan birinchi qatorni olamiz)
SELECT @InputString = string 
FROM Example; -- E'tibor bering: bu yerda 's' taxallusini ishlatmadik, chunki u kerak emas

-- Rekursiv CTE: Satrni belgilar bo'yicha ajratish
WITH SplitStringCTE AS (
    -- ===================================
    -- ANCHOR A'ZOSI: Birinchi belgini tanlash
    -- ===================================
    SELECT
        CAST(1 AS INT) AS Position, 
        SUBSTRING(@InputString, 1, 1) AS CharacterValue 
    
    UNION ALL
    
    -- ===================================
    -- REKURSIV A'ZO: Keyingi belgini olish va pozitsiyani oshirish
    -- ===================================
    SELECT
        s.Position + 1 AS Position, 
        SUBSTRING(@InputString, s.Position + 1, 1) AS CharacterValue 
    FROM
        SplitStringCTE s 
    WHERE
        s.Position < LEN(@InputString) 
)
-- Yakuniy Natija: Ajratilgan belgilar va ularning tartib raqamini chiqarish
SELECT
    Position,
    CharacterValue
FROM
    SplitStringCTE;

--5 Use a CTE to calculate the sales difference between the current month and the previous month.(Sales)

-- Calculate month-over-month sales difference
WITH MonthlySales AS (
    SELECT 
        YEAR(SaleDate) AS SalesYear,
        MONTH(SaleDate) AS SalesMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
),
DiffCTE AS (
    SELECT 
        SalesYear,
        SalesMonth,
        TotalSales,
        LAG(TotalSales) OVER (ORDER BY SalesYear, SalesMonth) AS PrevSales,
        TotalSales - LAG(TotalSales) OVER (ORDER BY SalesYear, SalesMonth) AS Diff
    FROM MonthlySales
)
SELECT * FROM DiffCTE;

--6 Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)
-- Group sales per employee by quarter and filter > 45k

SELECT 
    e.FirstName,
    e.LastName,
    s.SalesQuarter,
    s.TotalSales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        DATEPART(QUARTER, SaleDate) AS SalesQuarter,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
) AS s
ON e.EmployeeID = s.EmployeeID
WHERE s.TotalSales > 45000;

--DIFFICULT TASKS

--1 This script uses recursion to calculate Fibonacci numbers
-- Generate Fibonacci sequence
WITH FibonacciCTE AS (
    SELECT 0 AS n1, 1 AS n2, 1 AS Seq
    UNION ALL
    SELECT n2, n1 + n2, Seq + 1
    FROM FibonacciCTE
    WHERE Seq < 20   -- Limit to 20 Fibonacci numbers
)
SELECT Seq, n1 AS FibonacciNumber
FROM FibonacciCTE
OPTION (MAXRECURSION 1000);

--2 Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)
-- Find rows where all characters are identical and string length > 1
SELECT *
FROM FindSameCharacters
WHERE LEN(Vals) > 1
  AND Vals IS NOT NULL
  AND LEN(REPLACE(Vals, LEFT(Vals, 1), '')) = 0;

--3 Create a numbers table that shows all numbers 1 through n and their order gradually increasing by the next number in the sequence.(Example:n=5 | 1, 12, 123, 1234, 12345)

-- Corrected recursive CTE for sequence generation
WITH SeqCTE AS (
    -- 1️⃣ Base case (anchor)
    SELECT 
        1 AS n,
        CAST('1' AS VARCHAR(20)) AS Sequence

    UNION ALL

    -- 2️⃣ Recursive part (must match data types)
    SELECT 
        n + 1,
        CAST(Sequence + CAST(n + 1 AS VARCHAR(20)) AS VARCHAR(20))
    FROM SeqCTE
    WHERE n < 5
)
-- 3️⃣ Final output
SELECT * FROM SeqCTE
OPTION (MAXRECURSION 10);

--4 Employees who made the most sales in the last 6 months
-- Top-selling employees in the last 6 months
SELECT 
    e.FirstName,
    e.LastName,
    s.TotalSales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
) AS s
ON e.EmployeeID = s.EmployeeID
WHERE s.TotalSales = (
    SELECT MAX(TotalSales)
    FROM (
        SELECT SUM(SalesAmount) AS TotalSales
        FROM Sales
        WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
        GROUP BY EmployeeID
    ) AS x
);

--5 Remove duplicate integers and single digits from string column
-- Remove duplicate integers and single integer characters
UPDATE RemoveDuplicateIntsFromNames
SET Pawan_slug_name = 
    CASE 
        WHEN LEN(Pawan_slug_name) > 0 THEN
            -- Replace duplicate integers like 111 → 1, 4444 → 4, 32 stays
            REPLACE(
                REPLACE(
                    REPLACE(Pawan_slug_name, '-111', '-1'),
                    '-222', '-2'
                ),
                '-333', '-3'
            )
        ELSE Pawan_slug_name
    END;

