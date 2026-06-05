-- HAVING VS WHERE

-- ── KEY DIFFERENCE ───────────────────────────
-- WHERE  filters rows BEFORE grouping
-- HAVING filters groups AFTER grouping
-- That's why WHERE cannot use aggregate functions, but HAVING can

-- ── WHERE with aggregate -- ERROR ────────────
-- WHERE runs before GROUP BY, so AVG(age) doesn't exist yet at that stage
SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40 -- ERROR: aggregate functions not allowed in WHERE
GROUP BY gender
;

-- ── HAVING with aggregate -- CORRECT ─────────
-- HAVING runs after GROUP BY, so AVG(age) is already calculated
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

-- ── WHERE and HAVING used together ───────────
-- WHERE first filters rows where occupation contains 'manager'
-- then GROUP BY groups those filtered rows
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
;

-- WHERE filters rows first, then HAVING filters the resulting groups
-- Only manager occupations with avg salary above 75000 are returned
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;