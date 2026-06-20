-- ── UNION basics ──────────────────────────────
-- UNION stacks results of two or more SELECT queries vertically (one result set)
-- Each SELECT must return the SAME NUMBER of columns, in compatible data types
-- Column names in the output come from the FIRST SELECT

-- UNION DISTINCT removes duplicate rows (this is also the default behavior of plain UNION)
-- NOTE: this example combines unrelated columns (age/gender vs first_name/last_name)
-- just to demonstrate syntax -- not a meaningful real-world query
SELECT age, gender
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary
;

-- Plain UNION = UNION DISTINCT by default -- duplicate rows are automatically removed
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary
;

-- UNION ALL keeps ALL rows, including duplicates
-- Faster than UNION since MySQL doesn't need to check for duplicates
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;

-- ── Practical example: labeling rows from different queries ──
-- A literal string ('Old Man', 'Old Lady', etc.) can be added as a column
-- to tag which SELECT each row came from after they're combined
SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'

UNION

SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'

UNION

SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000

-- ORDER BY applies to the FINAL combined result, not each individual SELECT
-- Only goes once, at the very end of the whole UNION query
ORDER BY first_name, last_name
;





