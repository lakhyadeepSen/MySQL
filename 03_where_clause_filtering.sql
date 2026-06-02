-- WHERE Clause

-- ── COMPARISON OPERATORS ──────────────────────

-- Exact match on text
SELECT *
FROM employee_salary
WHERE first_name = 'Leslie'
;

-- Greater than
SELECT *
FROM employee_salary
WHERE salary > 50000
;

-- Greater than or equal to
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

-- Less than
SELECT *
FROM employee_salary
WHERE salary < 50000
;

-- Less than or equal to
SELECT *
FROM employee_salary
WHERE salary <= 50000
;

-- Equal to (text)
SELECT *
FROM employee_demographics
WHERE gender = 'Female'
;

-- Not equal to (!=  same as <>)
SELECT *
FROM employee_demographics
WHERE gender != 'Female'
;

-- Comparison on dates (use 'YYYY-MM-DD' format)
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

-- ── LOGICAL OPERATORS: AND, OR, NOT ──────────

-- AND: both conditions must be true
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Male'
;

-- OR: at least one condition must be true
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'Male'
;

-- NOT: excludes matching rows (NOT flips the condition)
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'Male'
;

-- Grouping with brackets controls evaluation order
-- '||' is the same as OR in MySQL
SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) || age > 55
;

-- ── LIKE: PATTERN MATCHING ────────────────────
-- '%' matches anything (zero or more characters)
-- '_' matches exactly one character

-- Starts with 'Jer'
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%'
;

-- Contains 'a' anywhere
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%a%'
;

-- Starts with 'a', followed by exactly 2 characters
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__'
;

-- 2nd character is 'a', followed by exactly 2 more characters
SELECT *
FROM employee_demographics
WHERE first_name LIKE '_a__'
;

-- Starts with 'a', at least 3 characters total
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%'
;

-- Birth date starts with '198' i.e. born in the 1980s
SELECT *
FROM employee_demographics
WHERE birth_date LIKE '198%' 
;