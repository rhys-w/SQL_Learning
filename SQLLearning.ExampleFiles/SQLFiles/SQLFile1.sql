------------------------------------------------------------------------------------------------------
-- Choosing the Database
USE SQL_Learning
------------------------------------------------------------------------------------------------------

CREATE TABLE Person (
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Age int
	);

-- Insert data
INSERT INTO Person (FirstName, LastName, Age) VALUES ('Rhys', 'Wakeham', 26);
INSERT INTO Person (FirstName, LastName, Age) VALUES ('Rhys', 'Smith', 28);
INSERT INTO Person (FirstName, LastName, Age) VALUES ('Bob', 'Smithson', 29);
INSERT INTO Person (FirstName, LastName, Age) VALUES ('Jane', 'Smiths', 31);
INSERT INTO Person (FirstName, LastName, Age) VALUES ('A', 'B', 22);
INSERT INTO Person (FirstName, Age) VALUES ('Alex', 20);

-- Update data
UPDATE Person SET FirstName = 'RhysEdited' WHERE FirstName = 'Rhys';

DELETE FROM Person WHERE LastName = 'Wakeham';

------------------------------------------------------------------------------------------------------
-- Select Statements: SELECT <COLUMN_NAME>, <COLUMN_NAME> FROM <TABLE_NAME>;

	-- Selecting constants
SELECT 'Hello', 'World';

	-- Selecting the first name and last name of every person
SELECT FirstName, LastName FROM Person;

	-- Select every column of every person
SELECT * FROM Person;

	-- Select the first name and last name of every person, but qualify the table name (Good Practice)
SELECT Person.FirstName, Person.LastName FROM Person;

	-- Aliasing a Table Name
SELECT P.FirstName, P.LastName FROM Person P;

	-- Aliasing Column Names
SELECT P.FirstName as First, P.LastName as Last FROM Person P;

	-- Distinct & Not Distinct
	-- 'What are all the first names of the people I know?'
SELECT P.FirstName, P.LastName FROM Person P; -- Can return multiple Rhys'
	-- 'What are all the unique first names of the people I know?'
SELECT DISTINCT P.FirstName, P.LastName FROM Person P; -- Returns only 1 Rhys

	-- Filtering with the WHERE clause
SELECT P.FirstName, P.LastName FROM Person P WHERE P.FirstName = 'Rhys';

-- WHERE CLAUSE BOOLEAN OPERATORS
	-- =	EQUALS
	-- <>	Not Equal To
	-- >	Greater Than
	-- <	Less Than
	-- >=	Greator or Equal
	-- <=	Less than or Equal
SELECT P.FirstName, P.LastName FROM Person P WHERE P.Id > 1;
SELECT P.FirstName, P.LastName FROM Person P WHERE P.Id <> 1;
SELECT P.FirstName, P.LastName FROM Person P WHERE P.FirstName <> 'Rhys';

-- WHERE KEYWORDS
	-- AND	Both expressions must be true
	-- OR	Either or b
SELECT P.FirstName, P.LastName FROM Person P WHERE P.FirstName = 'Rhys' OR P.LastName = 'Wakeham';
SELECT P.FirstName, P.LastName FROM Person P WHERE P.FirstName = 'Rhys' AND P.LastName = 'Wakeham';

-- WHERE OPERATORS
	-- BETWEEN	Acts on a columns value and two additional values. Inclusive
SELECT P.FirstName, P.Age FROM Person P WHERE P.Age BETWEEN 26 AND 30;

	-- LIKE		A fuzzy equals
SELECT P.FirstName, P.LastName, P.Age FROM Person P WHERE P.LastName LIKE 'Smith%';

	-- IN		List of potential values
SELECT P.FirstName, P.LastName, P.Age FROM Person P WHERE P.FirstName IN ('Jane', 'Bob');

	-- IS		Special operator. Like an equals, but specially for NULL
SELECT P.FirstName, P.LastName FROM Person P WHERE P.LastName IS NULL;
	-- IS NOT	Special operator. Like an equals but specially for NOT NULL
SELECT P.FirstName, P.LastName FROM Person P WHERE P.LastName IS NOT NULL;

-- ORDER BY Clause
	-- Sort by age (ascending)
SELECT P.FirstName, P.Age FROM Person P ORDER BY P.Age;
SELECT P.FirstName, P.Age FROM Person P ORDER BY P.Age ASC;

	-- Sort by age (descending)
SELECT P.FirstName, P.Age FROM Person P ORDER BY P.Age DESC;

	-- Sort by Surname (desc) where the entry has a last name
SELECT P.FirstName, P.LastName FROM Person P WHERE P.LastName IS NOT NULL ORDER BY P.LastName DESC;

-- SET FUNCTIONS
	-- COUNT	Count of the column specified (includes NULL values if * is used)
SELECT COUNT(*) FROM Person P WHERE P.FirstName = 'Rhys';
SELECT COUNT(DISTINCT P.FirstName) FROM Person P;
	-- MAX		Max value of the column (does not incude NULL values)
SELECT MAX(P.Age) FROM Person P;
	-- MIN		Min value of the column (does not include NULL values)
SELECT Min(P.Age) FROM Person P;
	-- AVG		Average of all value of the column (does not include NULL values, only numeric column)
SELECT AVG(P.Age) FROM Person P;
	-- SUM		Sum of all value of the column (does not include NULL values, only numeric column)
SELECT SUM(P.Age) FROM Person P;

-- GROUP BY Clause
	-- What is the count of every unique first name?
SELECT COUNT (P.FirstName), P.FirstName FROM Person P GROUP BY P.FirstName;

-- HAVING Clause
	-- Works like WHERE works against SELECT
	-- What is the count of unique first names among my contacts that appear more than once
SELECT COUNT(P.FirstName), P.FirstName FROM Person P GROUP BY P.FirstName HAVING COUNT(P.FirstName) > 1;
-- Can alias 'COUNT(P.FirstName)' and refer to it in HAVING ... but not in SQL Server

------------------------------------------------------------------------------------------------------

