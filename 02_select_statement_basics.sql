-- 1. Select all columns from the table
SELECT *
FROM parks_and_recreation.employee_demographics
;

-- 2. Select specific columns and use arithmetic expressions
SELECT first_name,
last_name,
birth_date,
age,
(age + 10) * 10  -- custom calculation on age
FROM parks_and_recreation.employee_demographics
;

-- 3. Get unique first names only (removes duplicates)
SELECT DISTINCT first_name
FROM parks_and_recreation.employee_demographics
;

-- 4. Get unique genders only
SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics
;

-- 5. Get unique combinations of first_name + gender
SELECT DISTINCT first_name,
gender
FROM parks_and_recreation.employee_demographics
;