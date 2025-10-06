-- EASY LEVEL TASKS (7)
-- 1. Show all orders placed after 2022 along with the names of the customers who placed them
SELECT 
    o.OrderID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) > 2022;

-- 2. Display employees who work in either the Sales or Marketing department
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing');

-- 3. Show the highest salary for each department
SELECT 
    d.DepartmentName,
    MAX(e.Salary) AS MaxSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 4. List all customers from the USA who placed orders in 2023
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND YEAR(o.OrderDate) = 2023;

-- 5. Show how many orders each customer has placed
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY CONCAT(c.FirstName, ' ', c.LastName);

-- 6. Display products supplied by Gadget Supplies or Clothing Mart
SELECT 
    p.ProductName,
    s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName IN ('Gadget Supplies', 'Clothing Mart');

-- 7. For each customer, show their most recent order (include those with no orders)
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY CONCAT(c.FirstName, ' ', c.LastName);

-- MEDIUM LEVEL TASKS (6)


-- 8. Customers who have placed an order where total amount > 500
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.TotalAmount AS OrderTotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount > 500;

-- 9. Product sales where sale was made in 2022 or amount > 400
SELECT 
    p.ProductName,
    s.SaleDate,
    s.SaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2022 OR s.SaleAmount > 400;

-- 10. Each product with total sales amount
SELECT 
    p.ProductName,
    SUM(s.SaleAmount) AS TotalSalesAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName;

-- 11. Employees in HR department earning > 60000
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName,
    e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources' AND e.Salary > 60000;

-- 12. Products sold in 2023 and had >100 in stock
SELECT 
    p.ProductName,
    s.SaleDate,
    p.StockQuantity
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2023 AND p.StockQuantity > 100;

-- 13. Employees in Sales dept OR hired after 2020
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName,
    e.HireDate
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' OR YEAR(e.HireDate) > 2020;

-- HARD LEVEL TASKS (7)

-- 14. Orders by USA customers whose address starts with 4 digits
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.OrderID,
    c.Address,
    o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND c.Address LIKE '[0-9][0-9][0-9][0-9]%';

-- 15. Product sales in Electronics category OR sale amount > 350
SELECT 
    p.ProductName,
    p.Category,
    s.SaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE p.Category = 'Electronics' OR s.SaleAmount > 350;

-- 16. Number of products per category
SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Products p
JOIN Categories c ON p.Category = c.CategoryID
GROUP BY c.CategoryName;

-- 17. Orders where customer is from Los Angeles and amount > 300
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    c.City,
    o.OrderID,
    o.TotalAmount AS Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City = 'Los Angeles' AND o.TotalAmount > 300;

-- 18. Employees in HR or Finance, or whose name contains ≥4 vowels
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Human Resources', 'Finance')
   OR LEN(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(e.Name, 'a',''), 'e',''), 'i',''), 'o',''), 'u','')) <= LEN(e.Name) - 4;

-- 19. Employees in Sales or Marketing with salary > 60000
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName,
    e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing') AND e.Salary > 60000;

