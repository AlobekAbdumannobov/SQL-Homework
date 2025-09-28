/* 
   LESSON 9 - JOINS HOMEWORK
*/

/* EASY LEVEL (10) */

/* 1. Using Products, Suppliers table - List all combinations of product names and supplier names. */
SELECT P.ProductName, S.SupplierName
FROM Products P
CROSS JOIN Suppliers S;

/* 2. Using Departments, Employees table - Get all combinations of departments and employees. */
SELECT D.DepartmentName, E.Name
FROM Departments D
CROSS JOIN Employees E;

/* 3. Using Products, Suppliers table - List only the combinations where the supplier actually supplies the product. */
SELECT S.SupplierName, P.ProductName
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID;

/* 4. Using Orders, Customers table - List customer names and their orders ID. */
SELECT C.FirstName + ' ' + C.LastName AS CustomerName, O.OrderID
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID;

/* 5. Using Courses, Students table - Get all combinations of students and courses. */
SELECT S.Name, C.CourseName
FROM Students S
CROSS JOIN Courses C;

/* 6. Using Products, Orders table - Get product names and orders where product IDs match. */
SELECT P.ProductName, O.OrderID
FROM Products P
INNER JOIN Orders O ON P.ProductID = O.ProductID;

/* 7. Using Departments, Employees table - List employees whose DepartmentID matches the department. */
SELECT E.Name, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

/* 8. Using Students, Enrollments table - List student names and their enrolled course IDs. */
SELECT S.Name, E.CourseID
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID;

/* 9. Using Payments, Orders table - List all orders that have matching payments. */
SELECT O.OrderID, P.PaymentID, P.Amount
FROM Orders O
INNER JOIN Payments P ON O.OrderID = P.OrderID;

/* 10. Using Orders, Products table - Show orders where product price is more than 100. */
SELECT O.OrderID, P.ProductName, P.Price
FROM Orders O
INNER JOIN Products P ON O.ProductID = P.ProductID
WHERE P.Price > 100;


/* MEDIUM LEVEL (10) */

/* 1. Employees & Departments - employee names and department names where department IDs are not equal. */
SELECT E.Name, D.DepartmentName
FROM Employees E
CROSS JOIN Departments D
WHERE E.DepartmentID <> D.DepartmentID;

/* 2. Orders & Products - Show orders where ordered quantity is greater than stock quantity. */
SELECT O.OrderID, P.ProductName, O.Quantity, P.StockQuantity
FROM Orders O
INNER JOIN Products P ON O.ProductID = P.ProductID
WHERE O.Quantity > P.StockQuantity;

/* 3. Customers & Sales - customer names and product IDs where sale amount is 500 or more. */
SELECT C.FirstName + ' ' + C.LastName AS CustomerName, S.ProductID, S.SaleAmount
FROM Sales S
INNER JOIN Customers C ON S.CustomerID = C.CustomerID
WHERE S.SaleAmount >= 500;

/* 4. Courses, Enrollments, Students - student names and course names they’re enrolled in. */
SELECT S.Name, C.CourseName
FROM Enrollments E
INNER JOIN Students S ON E.StudentID = S.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID;

/* 5. Products & Suppliers - List product and supplier names where supplier name contains 'Tech'. */
SELECT P.ProductName, S.SupplierName
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID
WHERE S.SupplierName LIKE '%Tech%';

/* 6. Orders & Payments - Show orders where payment amount is less than total amount. */
SELECT O.OrderID, O.TotalAmount, P.Amount
FROM Orders O
INNER JOIN Payments P ON O.OrderID = P.OrderID
WHERE P.Amount < O.TotalAmount;

/* 7. Employees & Departments - get the Department Name for each employee. */
SELECT E.Name, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

/* 8. Products & Categories - Show products where category is either 'Electronics' or 'Furniture'. */
SELECT P.ProductName, C.CategoryName
FROM Products P
INNER JOIN Categories C ON P.Category = C.CategoryID
WHERE C.CategoryName IN ('Electronics', 'Furniture');

/* 9. Sales & Customers - Show all sales from customers who are from 'USA'. */
SELECT S.SaleID, C.FirstName + ' ' + C.LastName AS CustomerName, S.SaleAmount
FROM Sales S
INNER JOIN Customers C ON S.CustomerID = C.CustomerID
WHERE C.Country = 'USA';

/* 10. Orders & Customers - List orders made by customers from 'Germany' and order total > 100. */
SELECT O.OrderID, C.FirstName + ' ' + C.LastName AS CustomerName, O.TotalAmount
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE C.Country = 'Germany' AND O.TotalAmount > 100;


/* HARD LEVEL (5) */

/* 1. Employees - List all pairs of employees from different departments. */
SELECT E1.Name AS Employee1, E2.Name AS Employee2
FROM Employees E1
INNER JOIN Employees E2 ON E1.EmployeeID < E2.EmployeeID
WHERE E1.DepartmentID <> E2.DepartmentID;

/* 2. Payments, Orders, Products - List payment details where paid amount != (Quantity × Product Price). */
SELECT P.PaymentID, O.OrderID, O.Quantity, PR.Price, (O.Quantity * PR.Price) AS Expected, P.Amount
FROM Payments P
INNER JOIN Orders O ON P.OrderID = O.OrderID
INNER JOIN Products PR ON O.ProductID = PR.ProductID
WHERE P.Amount <> (O.Quantity * PR.Price);

/* 3. Students, Enrollments, Courses - Find students who are not enrolled in any course. */
SELECT S.Name
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.EnrollmentID IS NULL;

/* 4. Employees - List employees who are managers of someone, but their salary <= the person they manage. */
SELECT M.Name AS Manager, E.Name AS Employee, M.Salary AS ManagerSalary, E.Salary AS EmployeeSalary
FROM Employees E
INNER JOIN Employees M ON E.ManagerID = M.EmployeeID
WHERE M.Salary <= E.Salary;

/* 5. Orders, Payments, Customers - List customers who have made an order, but no payment has been recorded. */
SELECT DISTINCT C.FirstName + ' ' + C.LastName AS CustomerName, O.OrderID
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE P.PaymentID IS NULL;
