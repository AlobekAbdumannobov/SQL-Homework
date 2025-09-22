-- BASIC LEVEL TASKS

-- 1. Employees jadvalini yaratish
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);
select * from Employees
-- 2. Uchta yozuv qo‘shish (turli usullar bilan)
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Ali', 5000.00);

INSERT INTO Employees
VALUES (2, 'Sevara', 6000.00);

INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(3, 'Jasur', 5500.00),
(4, 'Dilnoza', 4500.00);

-- 3. EmpID = 1 bo‘lgan xodimning maoshini 7000 ga o‘zgartirish
UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;

-- 4. EmpID = 2 bo‘lgan yozuvni o‘chirish
DELETE FROM Employees
WHERE EmpID = 2;

-- 5. DELETE vs TRUNCATE vs DROP
-- DELETE  -> ma’lumotni o‘chiradi, struktura saqlanadi
-- TRUNCATE -> barcha yozuvlarni tez o‘chiradi, struktura saqlanadi
-- DROP    -> jadvalni butunlay o‘chiradi

-- 6. Name ustunini VARCHAR(100) ga o‘zgartirish
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

-- 7. Department ustunini qo‘shish
ALTER TABLE Employees
ADD Department VARCHAR(50);

-- 8. Salary ustunini FLOAT ga o‘zgartirish
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

-- 9. Departments jadvalini yaratish
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- 10. Employees jadvalidan barcha yozuvlarni o‘chirish (strukturani qoldirib)
TRUNCATE TABLE Employees;


-- INTERMEDIATE LEVEL TASKS


-- 1. Departments jadvaliga yozuv qo‘shish (INSERT INTO SELECT)
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'IT'
UNION ALL
SELECT 2, 'HR'
UNION ALL
SELECT 3, 'Finance'
UNION ALL
SELECT 4, 'Marketing'
UNION ALL
SELECT 5, 'Management';

-- 2. Salary > 5000 bo‘lganlarning Department ustunini yangilash
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

-- 3. Employees jadvalidagi barcha yozuvlarni o‘chirish (strukturani qoldirib)
TRUNCATE TABLE Employees;

-- 4. Department ustunini o‘chirish
ALTER TABLE Employees
DROP COLUMN Department;

-- 5. Employees jadvalini StaffMembers deb nomlash
EXEC sp_rename 'Employees', 'StaffMembers';

-- 6. Departments jadvalini butunlay o‘chirish
DROP TABLE Departments;

-- ADVANCED LEVEL TASKS

-- 1. Products jadvalini yaratish
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Description VARCHAR(100)
);

-- 2. CHECK constraint qo‘shish (Price > 0)
ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);

-- 3. StockQuantity ustunini qo‘shish (DEFAULT 50 bilan)
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

-- 4. Category ustunini ProductCategory deb o‘zgartirish
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

-- 5. Products jadvaliga 5 ta yozuv qo‘shish
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES
(1, 'Laptop', 'Electronics', 1200.00, 'Gaming laptop'),
(2, 'Phone', 'Electronics', 800.00, 'Smartphone'),
(3, 'Chair', 'Furniture', 150.00, 'Office chair'),
(4, 'Table', 'Furniture', 300.00, 'Wooden table'),
(5, 'Shoes', 'Fashion', 100.00, 'Running shoes');

-- 6. Products jadvalidan nusxa olish (SELECT INTO)
SELECT * INTO Products_Backup
FROM Products;

-- 7. Products jadvalini Inventory deb nomlash
EXEC sp_rename 'Products', 'Inventory';

-- 8. Inventory jadvalidagi Price ustunini FLOAT ga o‘zgartirish
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

-- 9. ProductCode ustunini qo‘shish (IDENTITY 1000 dan boshlab, +5)
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5);
