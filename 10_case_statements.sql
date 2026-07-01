-- CASE Statements

-- CASE works like an IF/ELSE chain inside a SELECT
-- Checks each WHEN condition top to bottom; runs the first one that's true
-- Always end with END (and optionally AS alias for the resulting column)

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age > 50 THEN "On Death's Door"
END AS Age_Bracket
FROM employee_demographics
;

-- ── Practical example: Pay Increase & Bonus ──
-- Business rule being implemented:
-- salary < 50000  -> 5% raise
-- salary > 50000  -> 7% raise
-- dept_id = 6 (Finance) -> additional 10% bonus

SELECT first_name,
last_name,
salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)   -- 5% raise
	WHEN salary > 50000 THEN salary * 1.07              -- 7% raise
END AS New_salary,
CASE
	WHEN dept_id = 6 THEN salary * 1.10                 -- Finance dept gets 10% bonus
END AS Bonus                                            -- all other depts return NULL (no ELSE)
FROM employee_salary;
;
