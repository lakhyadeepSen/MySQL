-- Subqueries

-- A subquery is a SELECT query nested inside another query
-- The inner query runs first, then its result is used by the outer query
-- Subqueries can appear in WHERE, SELECT, and FROM clauses


-- ── Subquery in WHERE clause ──────────────────
-- Inner query returns a list of employee_ids from dept 1
-- Outer query fetches full demographics for those employees only
SELECT *
FROM employee_demographics
WHERE employee_id IN (
    SELECT employee_id
    FROM employee_salary
    WHERE dept_id = 1
);

-- ERROR: IN subquery must return exactly ONE column
-- Returning two columns (employee_id, dept_id) causes an error
SELECT *
FROM employee_demographics
WHERE employee_id IN (
    SELECT employee_id, dept_id  -- ERROR: only one column allowed with IN
    FROM employee_salary
    WHERE dept_id = 1
);


-- ── Subquery in SELECT clause ─────────────────
-- The subquery runs once and returns a single value (scalar subquery)
-- That value is repeated in every row of the result
-- Here it shows each employee's salary alongside the overall company average
SELECT first_name,
salary,
(
    SELECT AVG(salary)
    FROM employee_salary
) AS avg_salary           -- same avg value appears on every row
FROM employee_salary;


-- ── Subquery in FROM clause (Derived Table) ───
-- A subquery in FROM creates a temporary table (called a derived table)
-- It MUST be given an alias (AS Agg_table) -- required by MySQL

-- First, look at the aggregated data we want to wrap
SELECT gender,
AVG(age),
MAX(age),
MIN(age),
COUNT(age)
FROM employee_demographics
GROUP BY gender;

-- Wrap it as a derived table and SELECT from it
-- Column names default to the function expressions e.g. MAX(age)
SELECT *
FROM (
    SELECT gender,
    AVG(age),
    MAX(age),
    MIN(age),
    COUNT(age)
    FROM employee_demographics
    GROUP BY gender
) AS Agg_table;

-- To aggregate the derived table's columns, use backtick-quoted auto-generated names
-- Messy and fragile -- works but not recommended
SELECT AVG(`MAX(age)`)
FROM (
    SELECT gender,
    AVG(age),
    MAX(age),
    MIN(age),
    COUNT(age)
    FROM employee_demographics
    GROUP BY gender
) AS Agg_table;

-- BETTER: give each column a proper alias inside the subquery
-- Then reference the clean alias in the outer query
SELECT AVG(max_age)
FROM (
    SELECT gender,
    AVG(age) AS avg_age,
    MAX(age) AS max_age,
    MIN(age) AS min_age,
    COUNT(age)
    FROM employee_demographics
    GROUP BY gender
) AS Agg_table;