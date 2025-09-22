-- Puzzle 1: Finding Distinct Values
-- Variant 1: DISTINCT
SELECT DISTINCT
       CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
       CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

-- Variant 2: GROUP BY
SELECT
       MIN(col1) AS col1,
       MAX(col2) AS col2
FROM (
    SELECT CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
           CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
    FROM InputTbl
) AS t
GROUP BY col1, col2;

-- Puzzle 2: Removing Rows with All Zeroes
SELECT *
FROM TestMultipleZero
WHERE COALESCE(A,0) + COALESCE(B,0) + COALESCE(C,0) + COALESCE(D,0) > 0;

-- Puzzle 3: Find those with odd ids
SELECT *
FROM section1
WHERE id % 2 = 1;


-- Puzzle 4: Person with the smallest id

SELECT TOP 1 *
FROM section1
ORDER BY id ASC;

-- Puzzle 5: Person with the highest id

SELECT TOP 1 *
FROM section1
ORDER BY id DESC;

-- Puzzle 6: People whose name starts with b
-- Case-insensitive qidiruv
SELECT *
FROM section1
WHERE name LIKE 'b%';


-- Puzzle 7: Code contains underscore "_" literally

SELECT *
FROM ProductCodes
WHERE Code LIKE '%[_]%';
