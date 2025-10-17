   Lesson14_Practice.sql
-- 1. CREATE DATABASE va UNGA ULANISH
CREATE DATABASE Lesson14DB;
GO
USE Lesson14DB;
GO

-- 2. TABLE YARATISH
CREATE TABLE Employees (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100),
    HireDate DATE,
    BirthDate DATE,
    Salary DECIMAL(10,2)
);
GO

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    EmpID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);
GO

-- 3. SAMPLE DATA KIRITISH
INSERT INTO Employees (FullName, HireDate, BirthDate, Salary) VALUES
('Ali Karimov', '2018-03-12', '1990-07-21', 2500.00),
('Dilnoza Rasulova', '2020-08-01', '1995-02-10', 3000.00),
('Jasur Tursunov', '2015-12-05', '1988-11-17', 4200.00),
('Malika Sodiqova', '2019-05-23', '1993-04-09', 2800.00),
('Bobur Eshonov', '2021-07-14', '1998-06-01', 1800.00);
GO

INSERT INTO Orders (EmpID, OrderDate, TotalAmount) VALUES
(1, '2024-01-10 10:15:00', 550.00),
(2, '2024-02-12 15:45:00', 720.00),
(3, '2024-03-03 09:25:00', 1300.00),
(1, '2024-04-11 17:30:00', 850.00),
(5, '2024-05-29 11:10:00', 460.00);
GO

-- 4. EASY TASKS

-- Task 1: Hozirgi sana va vaqtni chiqarish
SELECT GETDATE() AS CurrentDateTime;

-- Task 2: Faqat sana va vaqtni alohida ko‘rsatish
SELECT CAST(GETDATE() AS DATE) AS TodayDate,
       CAST(GETDATE() AS TIME) AS CurrentTime;

-- Task 3: Sana ustiga 30 kun qo‘shish
SELECT DATEADD(DAY, 30, GETDATE()) AS After30Days;

-- Task 4: Ikki sana orasidagi farq (kunlarda)
SELECT DATEDIFF(DAY, '2024-01-01', GETDATE()) AS DaysSinceStart;

-- Task 5: Har bir xodimning ish staji (yillarda)
SELECT FullName,
       DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsOfWork
FROM Employees;

-- Task 6: Oy oxiri sanasini topish
SELECT EOMONTH(GETDATE()) AS EndOfMonth;

-- Task 7: Har safar random son hosil qilish (0–1 oralig‘ida)
SELECT RAND(CHECKSUM(NEWID())) AS RandomValue;

-- 5. MEDIUM TASKS

-- Task 8: Bugungi sana haqida batafsil ma’lumot
SELECT DATENAME(WEEKDAY, GETDATE()) AS WeekdayName,
       DATEPART(WEEK, GETDATE()) AS WeekNumber,
       DATENAME(MONTH, GETDATE()) AS MonthName;

-- Task 9: Ishga kirgan oy nomini chiqarish
SELECT FullName,
       DATENAME(MONTH, HireDate) AS HireMonth
FROM Employees;

-- Task 10: Maoshni formatda chiqarish
SELECT FullName, FORMAT(Salary, 'C', 'en-US') AS SalaryFormatted
FROM Employees;

-- Task 11: Har bir buyurtmaning yoshi (kunlarda)
SELECT OrderID, DATEDIFF(DAY, OrderDate, GETDATE()) AS OrderAgeDays
FROM Orders;

-- Task 12: Har bir xodim uchun yangi random kod yaratish
SELECT FullName, 
       CONVERT(VARCHAR(10), CHECKSUM(NEWID())) AS UniqueCode
FROM Employees;

-- 6. DIFFICULT TASKS

-- Task 13: Xodimning yoshini hisoblash
SELECT FullName,
       DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Employees;

-- Task 14: 2024-yil ichida tushgan buyurtmalarni ajratish
SELECT * FROM Orders
WHERE YEAR(OrderDate) = 2024;

-- Task 15: 1-iyundan 1-sentyabrgacha bo‘lgan buyurtmalar
SELECT * FROM Orders
WHERE OrderDate BETWEEN '2024-06-01' AND '2024-09-01';

-- Task 16: 10 ta random sana yaratish
SELECT TOP 10 
       DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, '2024-01-01') AS RandomDate;
GO

-- 7. QO‘SHIMCHA FUNKSIYALAR

-- Task 17: Sana turini turli formatlarda ko‘rsatish
SELECT 
    FORMAT(GETDATE(), 'dd.MM.yyyy') AS Format1,
    FORMAT(GETDATE(), 'MMMM yyyy') AS Format2,
    FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss') AS Format3;

-- Task 18: Sana va vaqtni CONVERT() bilan o‘zgartirish
SELECT 
    CONVERT(VARCHAR, GETDATE(), 103) AS DDMMYYYY,
    CONVERT(VARCHAR, GETDATE(), 120) AS ISOFormat;

-- Task 19: Xodimning keyingi ishga kirish sanasi (bir oy qo‘shish)
SELECT FullName, DATEADD(MONTH, 1, HireDate) AS NextHireMonth
FROM Employees;

