-- EASY LEVEL TASKS

-- 1. Har bir kategoriya bo‘yicha mahsulotlar soni
SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;

-- 2. 'Electronics' kategoriyasidagi mahsulotlarning o‘rtacha narxi
SELECT AVG(Price) AS AvgElectronicsPrice
FROM Products
WHERE Category = 'Electronics';

-- 3. Shahar nomi 'L' bilan boshlanadigan mijozlar
SELECT *
FROM Customers
WHERE City LIKE 'L%';

-- 4. Nomi 'er' bilan tugaydigan mahsulotlar
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%er';

-- 5. Mamlakati 'A' bilan tugaydigan mijozlar
SELECT *
FROM Customers
WHERE Country LIKE '%A';

-- 6. Eng qimmat mahsulot narxi
SELECT MAX(Price) AS HighestPrice
FROM Products;

-- 7. Mahsulotlar uchun stok statusi
SELECT ProductName,
       CASE WHEN StockQuantity < 30 THEN 'Low Stock'
            ELSE 'Sufficient' END AS StockStatus
FROM Products;

-- 8. Har bir mamlakatdagi mijozlar soni
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;

-- 9. Buyurtmalarda minimal va maksimal miqdor
SELECT MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity
FROM Orders;

-- MEDIUM LEVEL TASKS

-- 10. 2023-yanvar buyurtma qilgan, lekin faktura qilmagan mijozlar
SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE YEAR(o.OrderDate) = 2023 AND MONTH(o.OrderDate) = 1
AND o.CustomerID NOT IN (
    SELECT CustomerID FROM Invoices
    WHERE YEAR(InvoiceDate) = 2023 AND MONTH(InvoiceDate) = 1
);

-- 11. Products va Products_Discounted dan barcha nomlar (duplikatlar bilan)
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

-- 12. Products va Products_Discounted dan barcha nomlar (duplikatsiz)
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

-- 13. Har yil bo‘yicha o‘rtacha buyurtma summasi
SELECT YEAR(OrderDate) AS OrderYear,
       AVG(TotalAmount) AS AvgOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate);

-- 14. Mahsulotlarni narx bo‘yicha guruhlash
SELECT ProductName,
       CASE WHEN Price < 100 THEN 'Low'
            WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
            ELSE 'High' END AS PriceGroup
FROM Products;

-- 15. Yillar bo‘yicha pivot (2012, 2013)
SELECT district_name, [2012], [2013]
INTO Population_Each_Year
FROM (
    SELECT district_name, year, population
    FROM city_population
) AS src
PIVOT (
    SUM(population) FOR year IN ([2012],[2013])
) AS pvt;

-- 16. Har bir mahsulot bo‘yicha umumiy savdo summasi
SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

-- 17. Nomi ichida 'oo' bo‘lgan mahsulotlar
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';

-- 18. Shaharlar bo‘yicha pivot (Bektemir, Chilonzor, Yakkasaroy)
SELECT year, Bektemir, Chilonzor, Yakkasaroy
INTO Population_Each_City
FROM (
    SELECT district_name, year, population
    FROM city_population
) AS src
PIVOT (
    SUM(population) FOR district_name IN ([Bektemir],[Chilonzor],[Yakkasaroy])
) AS pvt;


-- HARD LEVEL TASKS

-- 19. Eng ko‘p xarajat qilgan TOP-3 mijoz
SELECT TOP 3 CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

-- 20. Population_Each_Year ni asl formatga qaytarish
SELECT district_name, '2012' AS Year, [2012] AS Population
FROM Population_Each_Year
UNION ALL
SELECT district_name, '2013', [2013]
FROM Population_Each_Year;

-- 21. Mahsulotlar va sotilgan soni
SELECT p.ProductName, COUNT(s.SaleID) AS TimesSold
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;

-- 22. Population_Each_City ni asl formatga qaytarish
SELECT 'Bektemir' AS City, year, Bektemir AS Population
FROM Population_Each_City
UNION ALL
SELECT 'Chilonzor', year, Chilonzor
FROM Population_Each_City
UNION ALL
SELECT 'Yakkasaroy', year, Yakkasaroy
FROM Population_Each_City;
