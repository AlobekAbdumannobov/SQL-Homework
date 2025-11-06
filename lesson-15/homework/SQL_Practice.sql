create database SQL_Practice15
go
use SQL_Practice15

--CREATE TABLE employees (
--    id INT PRIMARY KEY,
--    name VARCHAR(100),
--    salary DECIMAL(10, 2)
--);

--INSERT INTO employees (id, name, salary) VALUES
--(1, 'Alice', 50000),
--(2, 'Bob', 60000),
--(3, 'Charlie', 50000);

--1 Find Employees with Minimum Salary
-- Kompaniyada eng kam maosh (minimum salary) oladigan xodimlarni topish.

SELECT id, name, salary
FROM employees
WHERE salary = (
	SELECT MIN(salary) 
	FROM employees
);

--2 Find Products Above Average Price
-- Kompaniyada o‘rtacha narxdan yuqori bo‘lgan mahsulotlarni topish.

--CREATE TABLE products (
--    id INT PRIMARY KEY,
--    product_name VARCHAR(100),
--    price DECIMAL(10, 2)
--);

--INSERT INTO products (id, product_name, price) VALUES
--(1, 'Laptop', 1200),
--(2, 'Tablet', 400),
--(3, 'Smartphone', 800),
--(4, 'Monitor', 300);

SELECT id, product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

--3 Nested Subqueries with Conditions
--Sotuv (Sales) bo‘limida ishlaydigan xodimlarni toping.

--CREATE TABLE departments (
--    id INT PRIMARY KEY,
--    department_name VARCHAR(100)
--);
--go
--CREATE TABLE employees (
--    id INT PRIMARY KEY,
--    name VARCHAR(100),
--    department_id INT,
--    FOREIGN KEY (department_id) REFERENCES departments(id)
--);
--go
--INSERT INTO departments (id, department_name) VALUES
--(1, 'Sales'),
--(2, 'HR');
--go
--INSERT INTO employees (id, name, department_id) VALUES
--(1, 'David', 1),
--(2, 'Eve', 2),
--(3, 'Frank', 1);

SELECT e.id, e.name
FROM employees e
WHERE e.id in (
    SELECT id FROM departments WHERE department_name = 'Sales'
);

--4 Task: Retrieve customers who have not placed any orders. Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)			
-- Buyurtma bermagan mijozlarni toping.

--CREATE TABLE customers (
--    customer_id INT PRIMARY KEY,
--    name VARCHAR(100)
--);

--CREATE TABLE orders (
--    order_id INT PRIMARY KEY,
--    customer_id INT,
--    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
--);

--INSERT INTO customers (customer_id, name) VALUES
--(1, 'Grace'),
--(2, 'Heidi'),
--(3, 'Ivan');

--INSERT INTO orders (order_id, customer_id) VALUES
--(1, 1),
--(2, 1);
							
SELECT customer_id, name
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);

--5 Find Products with Max Price in Each Category
-- Har bir toifadagi eng yuqori narxga ega mahsulotlarni aniqlang.
drop table  products
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);

SELECT id, product_name, price, category_id
FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category_id = p.category_id
);

--6 Find Employees in Department with Highest Average Salary
-- O‘rtacha ish haqi eng yuqori bo‘lgan bo‘limda ishlaydigan xodimlarni aniqlang.
--drop table departments
--CREATE TABLE departments (
--    id INT PRIMARY KEY,
--    department_name VARCHAR(100)
--);
--drop table employees
--CREATE TABLE employees (
--    id INT PRIMARY KEY,
--    name VARCHAR(100),
--    salary DECIMAL(10, 2),
--    department_id INT,
--    FOREIGN KEY (department_id) REFERENCES departments(id)
--);

--INSERT INTO departments (id, department_name) VALUES
--(1, 'IT'),
--(2, 'Sales');

--INSERT INTO employees (id, name, salary, department_id) VALUES
--(1, 'Jack', 80000, 1),
--(2, 'Karen', 70000, 1),
--(3, 'Leo', 60000, 2);

SELECT id, name, salary, department_id
FROM employees
WHERE department_id = (
    SELECT TOP 1 department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);

--7 Find Employees Earning Above Department Average
-- O‘z bo‘limidagi o‘rtacha ish haqidan yuqori maosh oladigan xodimlarni aniqlang.
--drop table employees
--CREATE TABLE employees (
--    id INT PRIMARY KEY,
--    name VARCHAR(100),
--    salary DECIMAL(10, 2),
--    department_id INT
--);

--INSERT INTO employees (id, name, salary, department_id) VALUES
--(1, 'Mike', 50000, 1),
--(2, 'Nina', 75000, 1),
--(3, 'Olivia', 40000, 2),
--(4, 'Paul', 55000, 2);


SELECT e.id, e.name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);

--8 Find Students with Highest Grade per Course
-- Har bir kurs bo‘yicha eng yuqori baho olgan talabalarni toping

--CREATE TABLE students (
--    student_id INT PRIMARY KEY,
--    name VARCHAR(100)
--);

--CREATE TABLE grades (
--    student_id INT,
--    course_id INT,
--    grade DECIMAL(4, 2),
--    FOREIGN KEY (student_id) REFERENCES students(student_id)
--);

--INSERT INTO students (student_id, name) VALUES
--(1, 'Sarah'),
--(2, 'Tom'),
--(3, 'Uma');

--INSERT INTO grades (student_id, course_id, grade) VALUES
--(1, 101, 95),
--(2, 101, 85),
--(3, 102, 90),
--(1, 102, 80);

SELECT
    s.name AS student_name,
    g.course_id,
    g.grade
FROM
    grades g
JOIN
    students s ON g.student_id = s.student_id
WHERE
    g.grade = (
        -- Korrelyatsiyalangan Subquery: Joriy kurs (g.course_id) bo'yicha eng yuqori bahoni topish
        SELECT MAX(g_inner.grade)
        FROM grades g_inner
        WHERE g_inner.course_id = g.course_id
    );

--9 Subqueries with Ranking and Complex Conditions
--Har bir toifadagi uchinchi eng qimmat mahsulotni toping
--drop table products
--CREATE TABLE products (
--    id INT PRIMARY KEY,
--    product_name VARCHAR(100),
--    price DECIMAL(10, 2),
--    category_id INT
--);

--INSERT INTO products (id, product_name, price, category_id) VALUES
--(1, 'Phone', 800, 1),
--(2, 'Laptop', 1500, 1),
--(3, 'Tablet', 600, 1),
--(4, 'Smartwatch', 300, 1),
--(5, 'Headphones', 200, 2),
--(6, 'Speakers', 300, 2),
--(7, 'Earbuds', 100, 2);


--with cte as (
--select *, rank() over(partition by category_id order by price desc) as ProductRank from products
--) 
--select id, product_name, price, category_id from cte 
--where ProductRank = 3

SELECT
    p.id,
    p.product_name,
    p.price,
    p.category_id
FROM
    products p -- Tashqi so'rov: Mahsulotlar jadvali
WHERE
 3= (
        -- Korrelyatsiyalangan Subquery: Joriy mahsulot (p) uchun uchinchi eng yuqori narxni tekshirish
        SELECT COUNT(DISTINCT p_inner.price) -- Noyob narxlarni sanash
        FROM products p_inner
        WHERE p_inner.category_id = p.category_id -- 1. O'sha kategoriya ichida bo'lishi kerak
          AND p_inner.price >= p.price          -- 2. Joriy mahsulot narxidan (p.price) katta yoki teng bo'lishi kerak
    );

--10 Find Employees whose Salary Between Company Average and Department Max Salary
-- 
--drop table employees
--CREATE TABLE employees (
--    id INT PRIMARY KEY,
--    name VARCHAR(100),
--    salary DECIMAL(10, 2),
--    department_id INT
--);

--INSERT INTO employees (id, name, salary, department_id) VALUES
--(1, 'Alex', 70000, 1),
--(2, 'Blake', 90000, 1),
--(3, 'Casey', 50000, 2),
--(4, 'Dana', 60000, 2),
--(5, 'Evan', 75000, 1);

SELECT e.*
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees)
  AND e.salary < (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
  );

	
	




