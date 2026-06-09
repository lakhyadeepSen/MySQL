-- JOINS


-- ── INNER JOIN ────────────────────────────────
-- Returns only rows that have a matching value in BOTH tables
-- Non-matching rows are excluded from the result

-- Basic INNER JOIN using full table names
SELECT *
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
;

-- Same INNER JOIN using table aliases (shorter, cleaner)
-- JOIN alone = INNER JOIN (keyword INNER is optional)
SELECT *
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Select specific columns only (best practice over SELECT *)
-- Prefix with alias when the column name exists in both tables
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


-- ── OUTER JOINS ───────────────────────────────

-- LEFT JOIN: returns ALL rows from the left table (dem)
-- plus matched rows from the right table (sal)
-- Unmatched right-side columns show as NULL
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- RIGHT JOIN: returns ALL rows from the right table (sal)
-- plus matched rows from the left table (dem)
-- Unmatched left-side columns show as NULL
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


-- ── SELF JOIN ─────────────────────────────────
-- A table joined to itself using two different aliases
-- Useful for comparing rows within the same table

-- Joining each employee to themselves (not very useful, just demonstrates syntax)
SELECT *
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id = emp2.employee_id
;

-- Shift by 1: match each employee to the person with the next employee_id
-- e.g. employee 1 is paired with employee 2, employee 2 with employee 3
SELECT *
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- Practical self join example: Secret Santa pairing
-- Each employee (emp1) is assigned the next employee (emp2) as their Santa
SELECT emp1.employee_id AS emp_santa1,
emp1.first_name AS first_name_santa1,
emp1.last_name AS last_name_santa1,
emp2.employee_id AS emp_santa2,
emp2.first_name AS first_name_santa2,
emp2.last_name AS last_name_santa2
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;


-- ── JOINING MULTIPLE TABLES ───────────────────
-- You can chain multiple JOINs in a single query
-- Each JOIN adds another table to the result

-- Starting point: demographics + salary (two tables)
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Preview the departments table
SELECT *
FROM parks_departments
;

-- Three-table JOIN: demographics + salary + departments
-- Link salary to departments via dept_id = department_id
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id
;