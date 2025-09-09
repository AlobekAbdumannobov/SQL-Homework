/*
Lesson 1: Introduction to SQL Server and SSMS
Homework
*/

-- Easy

-- 1: Define the following terms: data, database, relational database, and table.
-- Data: Raw information like numbers, text, or dates.
-- Database: A place to store and organize data.
-- Relational Database: Stores data in multiple tables that are related by keys.
-- Table: A structure inside a database with rows and columns.

-- 2: List five key features of SQL Server.
-- 1. Secure data storage.
-- 2. High performance with large data.
-- 3. Backup and restore support.
-- 4. Works well with other Microsoft tools.
-- 5. Scalable for small or big systems.

-- 3: What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
-- 1. Windows Authentication (uses computer login).
-- 2. SQL Server Authentication (username and password).

-- Medium

-- 4: Create a new database in SSMS named SchoolDB.
CREATE DATABASE SchoolDB;

-- 5: Write and execute a query to create a table called Students 
-- with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
USE SchoolDB;
CREATE TABLE Students (StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT);

-- 6: Describe the differences between SQL Server, SSMS, and SQL.
-- SQL Server: The system that stores and manages data.
-- SSMS: A tool with a GUI to work with SQL Server.
-- SQL: The language we use to query and update data.

-- Hard

-- 7: Explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
-- DQL (Data Query Language): SELECT → get data.
-- DML (Data Manipulation Language): INSERT, UPDATE, DELETE → change data.
-- DDL (Data Definition Language): CREATE, ALTER, DROP → manage tables/databases.
-- DCL (Data Control Language): GRANT, REVOKE → give or remove permissions.
-- TCL (Transaction Control Language): COMMIT, ROLLBACK → manage transactions.

-- 8: Write a query to insert three records into the Students table.
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Nozima', 20), (2, 'Shahnoza', 22),(3, 'Sevara', 19);

-- 9: Restore AdventureWorksDW2022.bak file to your server. (steps)
-- 1. Open SSMS and connect to your SQL Server.
-- 2. Right-click "Databases" → "Restore Database".
-- 3. Choose "Device" and select the .bak file.
-- 4. Set the database name (AdventureWorksDW2022).
-- 5. Check the file paths.
-- 6. Click OK to finish restore.
