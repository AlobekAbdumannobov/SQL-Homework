-- EASY LEVEL TASKS
-- 1. ProductName ustunini Name qilib aliaslash
SELECT ProductName AS Name
FROM Products;

-- 2. Customers jadvalini Client deb aliaslash
SELECT *
FROM Customers AS Client;

-- 3. UNION – Products va Products_Discounted
SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;

-- 4. INTERSECT – umumiy mahsulotlarni topish
SELECT ProductName
FROM Products
INTERSECT
SELECT ProductName
FROM Products_Discounted;

-- 5. DISTINCT – mijoz ismlari va mamlakati
SELECT DISTINCT FirstName, Country
FROM Customers;

-- 6. CASE – narxni High yoki Low
SELECT ProductName,
       CASE 
            WHEN Price > 1000 THEN 'High'
            ELSE 'Low'
       END AS PriceCategory
FROM Products;

-- 7. IIF – zaxira 100 dan katta yoki yo‘qligi
SELECT ProductName,
       IIF(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;


-- MEDIUM LEVEL TASKS


-- 1. UNION – yana birlashtirish
SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;

-- 2. EXCEPT – Products da bor, lekin Discounted da yo‘q
SELECT ProductName
FROM Products
EXCEPT
SELECT ProductName
FROM Products_Discounted;

-- 3. IIF – qimmat yoki arzon
SELECT ProductName,
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceLevel
FROM Products;

-- 4. 25 yoshdan kichik yoki 60000 dan ko‘p maosh
SELECT *
FROM Employees
WHERE Age < 25 OR Salary > 60000;

-- 5. HR yoki EmployeeID = 5 bo‘lsa 10% oshirish
UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR' OR EmployeeID = 5;

-- HARD LEVEL TASKS

-- 1. CASE – SaleAmount darajalari
SELECT SaleID, SaleAmount,
       CASE
            WHEN SaleAmount > 500 THEN 'Top Tier'
            WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
            ELSE 'Low Tier'
       END AS SaleCategory
FROM Sales;

-- 2. EXCEPT – Ordersdagi, lekin Salesda yo‘q mijozlar
SELECT CustomerID
FROM Orders
EXCEPT
SELECT CustomerID
FROM Sales;

-- 3. CASE – buyurtma miqdoriga qarab chegirma
SELECT CustomerID, Quantity,
       CASE
            WHEN Quantity = 1 THEN '3%'
            WHEN Quantity BETWEEN 2 AND 3 THEN '5%'
            ELSE '7%'
       END AS DiscountPercentage
FROM Orders;
