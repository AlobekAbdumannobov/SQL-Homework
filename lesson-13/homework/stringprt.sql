/* ===========================================================
   📘 SQL Practice Set – Easy, Medium, Difficult
 /* --- 1. Combine Employee ID and Full Name --- */
SELECT 
    CAST(EMPLOYEE_ID AS VARCHAR(10)) + '-' + FIRST_NAME + ' ' + LAST_NAME AS Result
FROM Employees
WHERE EMPLOYEE_ID = 100;


/* --- 2. Replace '124' with '999' in PHONE_NUMBER --- */
UPDATE Employees
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124', '999');

SELECT EMPLOYEE_ID, PHONE_NUMBER 
FROM Employees 
WHERE PHONE_NUMBER LIKE '%999%';


/* --- 3. Names starting with A, J, or M with name length --- */
SELECT 
    FIRST_NAME AS [First Name],
    LEN(FIRST_NAME) AS [Name Length]
FROM Employees
WHERE LEFT(FIRST_NAME, 1) IN ('A', 'J', 'M')
ORDER BY FIRST_NAME;


/* --- 4. Total salary per MANAGER_ID --- */
SELECT 
    MANAGER_ID, 
    SUM(SALARY) AS Total_Salary
FROM Employees
GROUP BY MANAGER_ID
ORDER BY MANAGER_ID;


/* --- 5. Greatest of 3 columns (TestMax Table) --- */
SELECT 
    Year,
    CASE 
        WHEN Max1 >= Max2 AND Max1 >= Max3 THEN Max1
        WHEN Max2 >= Max1 AND Max2 >= Max3 THEN Max2
        ELSE Max3
    END AS Highest_Value
FROM TestMax;


/* --- 6. Odd Id and Not Boring movies from Cinema --- */
SELECT *
FROM Cinema
WHERE Id % 2 = 1
  AND Description NOT LIKE '%boring%';


/* --- 7. Sort by Id but keep Id = 0 at the end --- */
SELECT *
FROM SingleOrder
ORDER BY CASE WHEN Id = 0 THEN 1 ELSE 0 END, Id;


/* --- 8. First Non-Null Value from Person Table --- */
SELECT 
    COALESCE(Column1, Column2, Column3, Column4) AS First_Non_Null
FROM Person;


--🧠 MEDIUM LEVEL TASKS
  
/* --- 9. Find employees with salary greater than average --- */
SELECT 
    FIRST_NAME, LAST_NAME, SALARY
FROM Employees
WHERE SALARY > (SELECT AVG(SALARY) FROM Employees)
ORDER BY SALARY DESC;


/* --- 10. Find second highest salary --- */
SELECT MAX(SALARY) AS Second_Highest_Salary
FROM Employees
WHERE SALARY < (SELECT MAX(SALARY) FROM Employees);


/* --- 11. Display employees hired in 2020 --- */
SELECT *
FROM Employees
WHERE YEAR(HIRE_DATE) = 2020;


/* --- 12. Count employees per department --- */
SELECT DEPARTMENT_ID, COUNT(*) AS Total_Employees
FROM Employees
GROUP BY DEPARTMENT_ID;


/* --- 13. Show departments with more than 5 employees --- */
SELECT DEPARTMENT_ID, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 5;


/* --- 14. Employee name and department name using JOIN --- */
SELECT 
    e.FIRST_NAME + ' ' + e.LAST_NAME AS FullName,
    d.DEPARTMENT_NAME
FROM Employees e
JOIN Departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;


/* --- 15. Find employees without a manager --- */
SELECT FIRST_NAME, LAST_NAME
FROM Employees
WHERE MANAGER_ID IS NULL;


/* --- 16. Display employee and their manager’s name --- */
SELECT 
    e.FIRST_NAME + ' ' + e.LAST_NAME AS Employee,
    m.FIRST_NAME + ' ' + m.LAST_NAME AS Manager
FROM Employees e
LEFT JOIN Employees m ON e.MANAGER_ID = m.EMPLOYEE_ID;


/*    ⚙️ DIFFICULT TASKS
 */

/* --- 17. Find top 3 salaries using window function --- */
SELECT 
    FIRST_NAME, LAST_NAME, SALARY,
    DENSE_RANK() OVER (ORDER BY SALARY DESC) AS Rank_No
FROM Employees
WHERE DENSE_RANK() OVER (ORDER BY SALARY DESC) <= 3;


/* --- 18. Find cumulative salary by department --- */
SELECT 
    DEPARTMENT_ID,
    FIRST_NAME,
    SALARY,
    SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS Running_Total
FROM Employees;


/* --- 19. Employees who earn above department average --- */
SELECT *
FROM Employees e
WHERE SALARY > (
    SELECT AVG(SALARY)
    FROM Employees
    WHERE DEPARTMENT_ID = e.DEPARTMENT_ID
);


/* --- 20. Random student ID between 1 and 100 --- */
SELECT ROUND(RAND() * 100, 0) AS Random_Student_ID;


/* --- 21. Oracle version for random number --- */
-- SELECT ROUND(DBMS_RANDOM.VALUE(1, 100)) AS Random_Student_ID FROM dual;


/* --- 22. Create a view for high-paid employees --- */
CREATE VIEW HighSalaryEmployees AS
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM Employees
WHERE SALARY > 10000;


/* --- 23. Delete all rows from a table but keep structure --- */
TRUNCATE TABLE TempData;


/* --- 24. Transaction control example --- */
BEGIN TRANSACTION;
    UPDATE Employees SET SALARY = SALARY * 1.1 WHERE DEPARTMENT_ID = 90;
COMMIT TRANSACTION;


/* --- 25. Rollback example --- */
BEGIN TRANSACTION;
    DELETE FROM Employees WHERE EMPLOYEE_ID = 105;
ROLLBACK TRANSACTION;


/* --- 26. Create trigger for log history --- */
CREATE TRIGGER trg_LogSalaryChange
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO SalaryLog(EmployeeID, OldSalary, NewSalary, ChangeDate)
    SELECT d.EMPLOYEE_ID, d.SALARY, i.SALARY, GETDATE()
    FROM deleted d
    JOIN inserted i ON d.EMPLOYEE_ID = i.EMPLOYEE_ID;
END;
GO

