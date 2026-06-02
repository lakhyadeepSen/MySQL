-- GROUP BY
-- Groups rows with the same value into summary rows
-- Every column in SELECT must either be in GROUP BY or use an aggregate function

-- Group by gender (valid — selected column matches GROUP BY)
SELECT gender
FROM employee_demographics
GROUP BY gender
;

-- ERROR: first_name is not in GROUP BY and has no aggregate function
-- MySQL doesn't know which first_name to pick for each gender group
SELECT first_name
FROM employee_demographics
GROUP BY gender
;

-- Aggregate functions summarize data within each group
-- AVG, MAX, MIN, COUNT all work on the grouped rows
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;


-- ORDER BY
-- Sorts the result set by one or more columns
-- Default sort order is ASC (ascending) if not specified

-- ASC is the default — no need to write it explicitly
SELECT *
FROM employee_demographics
ORDER BY first_name
;

-- Explicitly ascending (A → Z)
SELECT *
FROM employee_demographics
ORDER BY first_name ASC
;

-- Descending (Z → A)
SELECT *
FROM employee_demographics
ORDER BY first_name DESC -- descending order of names
;

-- Sort by multiple columns: first by gender, then by age within each gender
SELECT *
FROM employee_demographics
ORDER BY gender, age
;

-- gender sorts ASC, age sorts DESC within each gender group
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC
;

-- age is the primary sort; gender only matters when two ages are equal
-- here ages are all unique so gender never breaks a tie — effectively useless
SELECT *
FROM employee_demographics
ORDER BY age, gender
;

-- Sorting by column position number (5 = 5th column, 4 = 4th column)
-- Works but NOT recommended — breaks if columns are reordered
SELECT *
FROM employee_demographics
ORDER BY 5, 4
;