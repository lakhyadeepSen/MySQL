-- String Functions

-- LENGTH() returns the number of characters in a string
SELECT LENGTH('skyfall');

-- Apply LENGTH to a column to get each name's character count
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
;

-- ORDER BY 2 sorts by the 2nd column in SELECT (the LENGTH result)
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER  BY 2
;

-- UPPER() converts text to all uppercase
SELECT UPPER('sky');

-- LOWER() converts text to all lowercase
SELECT LOWER('SKY');

-- Apply UPPER to a column
SELECT first_name, UPPER(first_name)
FROM employee_demographics
;

-- A plain string with extra spaces -- shown as-is, spaces still present
SELECT ('          sky          ');

-- TRIM() removes spaces from BOTH the start and end of a string
SELECT TRIM('          sky          ');

-- LTRIM() removes spaces from the LEFT (start) only
SELECT LTRIM('          sky          ');

-- RTRIM() removes spaces from the RIGHT (end) only
SELECT RTRIM('          sky          ');

-- LEFT(string, n) grabs the first n characters
-- RIGHT(string, n) grabs the last n characters
SELECT first_name,
LEFT(first_name, 4),
RIGHT(first_name, 4)
FROM employee_demographics
;

-- SUBSTRING(string, start, length) grabs characters from a starting position
-- Extracts 2 characters starting at position 3 of first_name
-- birth_date stored as text here -- SUBSTRING(birth_date, 6, 2) pulls out the month (positions 6-7 in YYYY-MM-DD)
SELECT first_name,
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics
;

-- REPLACE(string, old, new) swaps every occurrence of 'old' with 'new'
-- Replaces every 'a' in first_name with 'z'
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics
;

-- LOCATE(substring, string) returns the position where substring first appears
-- Returns 0 if not found (case-insensitive by default)
-- 'x' is not in 'ALEXANDER' as lowercase, but LOCATE is case-insensitive so it still won't find 'x'... actually returns 5 (matches 'X')
SELECT LOCATE('x', 'ALEXANDER');

-- Find the starting position of 'AN' within each first_name
-- Returns 0 if 'AN' is not found in that name
SELECT first_name, LOCATE('AN', first_name)
FROM employee_demographics
;

-- CONCAT() joins multiple strings/columns together into one
-- Combines first_name + space + last_name into a single full_name column
SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics
;