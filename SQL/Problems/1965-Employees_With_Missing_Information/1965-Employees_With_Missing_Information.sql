/*
LeetCode 1965. Employees With Missing Information
https://leetcode.com/problems/employees-with-missing-information/
*/


-- Solution #01: Implementing a FULL OUTER JOIN in MySQL

WITH joined_tables AS (
    SELECT *
    FROM Employees
        LEFT JOIN Salaries
        USING(employee_id)
    UNION 
    SELECT *
    FROM Employees
        RIGHT JOIN Salaries
    USING(employee_id)
)

SELECT employee_id
FROM joined_tables
WHERE name IS NULL OR salary IS NULL
ORDER BY employee_id;


-- Solution #02: Using UNION + GROUP BY

WITH emp_info AS (
    SELECT *
    FROM Employees
    UNION
    SELECT *
    FROM Salaries
)

SELECT employee_id
FROM emp_info
GROUP BY employee_id
HAVING COUNT(*) < 2
ORDER BY employee_id ASC;