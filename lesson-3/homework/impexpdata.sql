
-- EASY LEVEL TASKS

-- 1. BULK INSERT maqsadi:
-- BULK INSERT tashqi fayldan (CSV, TXT, Excel) katta hajmdagi ma’lumotlarni tez import qiladi.

-- 2. Import qilinadigan fayl formatlari:
-- CSV, TXT, Excel (XLS/XLSX), XML

-- 3. Products jadvali yaratish
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

-- 4. 3 ta yozuv qo‘shish
INSERT INTO Products VALUES (1, 'Laptop', 1200.00);
INSERT INTO Products VALUES (2, 'Phone', 800.00);
INSERT INTO Products VALUES (3, 'Shoes', 100.00);

-- 5. NULL va NOT NULL farqi:
-- NULL -> qiymat yo‘q
-- NOT NULL -> qiymat kiritilishi majburiy

-- 6. UNIQUE constraint qo‘shish
ALTER TABLE Products
ADD CONSTRAINT uq_productname UNIQUE (ProductName);

-- 7. Izoh yozish
-- Bu query barcha mahsulotlarni chiqaradi
SELECT * FROM Products;

-- 8. CategoryID ustuni qo‘shish
ALTER TABLE Products
ADD CategoryID INT;

-- 9. Categories jadvali
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

-- 10. IDENTITY ustuni maqsadi:
-- IDENTITY ustuni avtomatik ketma-ket raqam hosil qiladi.


-- MEDIUM LEVEL TASKS


-- 1. BULK INSERT misoli (yo‘lni o‘zingiz faylga qarab almashtirasiz)
BULK INSERT Products
FROM 'C:\data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- 2. FOREIGN KEY qo‘shish
ALTER TABLE Products
ADD CONSTRAINT fk_category FOREIGN KEY (CategoryID)
REFERENCES Categories (CategoryID);

-- 3. PRIMARY va UNIQUE farqi:
-- PRIMARY KEY -> har doim NOT NULL, jadvalda faqat 1 ta bo‘ladi
-- UNIQUE -> takrorlanmaydi, lekin NULL bo‘lishi mumkin, bir nechta UNIQUE bo‘lishi mumkin

-- 4. CHECK constraint (Price > 0)
ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);

-- 5. Stock ustuni qo‘shish
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

-- 6. ISNULL ishlatish
SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;

-- 7. FOREIGN KEY maqsadi:
-- FOREIGN KEY jadvallar orasida bog‘lanishni ta’minlaydi va ma’lumot yaxlitligini saqlaydi.


-- HARD LEVEL TASKS


-- 1. Customers jadvali (Age >= 18)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18)
);

-- 2. Identity jadval (100 dan boshlanadi, 10 qadam bilan)
CREATE TABLE TestIdentity (
    ID INT IDENTITY(100,10) PRIMARY KEY,
    Value VARCHAR(50)
);

-- 3. Composite PRIMARY KEY (OrderID + ProductID)
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

-- 4. COALESCE va ISNULL farqi:
-- ISNULL -> faqat 1 ta qiymatni almashtiradi
-- COALESCE -> birinchi NULL bo‘lmagan qiymatni qaytaradi

SELECT ISNULL(NULL, 'Default') AS ExampleISNULL;
SELECT COALESCE(NULL, NULL, 'FirstNotNull') AS ExampleCOALESCE;

-- 5. Employees jadvali (PRIMARY KEY + UNIQUE)
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

-- 6. FOREIGN KEY CASCADE bilan
ALTER TABLE Products
ADD CONSTRAINT fk_products_category FOREIGN KEY (CategoryID)
REFERENCES Categories (CategoryID)
ON DELETE CASCADE
ON UPDATE CASCADE;

