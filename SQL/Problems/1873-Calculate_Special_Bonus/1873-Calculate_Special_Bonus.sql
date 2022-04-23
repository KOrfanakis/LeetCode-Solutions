/*
LeetCode 1873. Calculate Special Bonus
https://leetcode.com/problems/calculate-special-bonus/
*/


-- Solution #01: Using CASE

SELECT
    employee_id,
    CASE
        WHEN MOD(employee_id, 2) != 0 AND name NOT LIKE 'M%' THEN salary
        ELSE 0
    END AS 'bonus'
FROM Employees
ORDER BY employee_id;


-- Solution #02: Using IF

SELECT
    employee_id,
    IF (MOD(employee_id, 2) = 0 OR name LIKE 'M%', 0, salary) AS 'bonus'
FROM Employees
ORDER BY employee_id;