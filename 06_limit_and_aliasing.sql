-- LIMIT & ALIASING


-- ── LIMIT ────────────────────────────────────
-- Restricts how many rows are returned

-- Return only the first 3 rows
SELECT *
FROM employee_demographics
LIMIT 3
;

-- Sort by age descending, then return top 3 (oldest 3 people)
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;


-- LIMIT offset, count
-- Skip the first 2 rows, then return 1 row
-- Useful for pagination
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;


-- ── ALIASING ─────────────────────────────────
-- AS gives a column a temporary display name in the result
-- The alias can then be referenced in HAVING

-- Using AS keyword (explicit & recommended)
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;

-- Without AS keyword (implicit alias — same result, less readable)
SELECT gender, AVG(age) avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;