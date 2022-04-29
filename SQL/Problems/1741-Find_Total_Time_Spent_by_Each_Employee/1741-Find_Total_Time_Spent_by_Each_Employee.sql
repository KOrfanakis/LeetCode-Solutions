/*
LeetCode 1741. Find Total Time Spent by Each Employee
https://leetcode.com/problems/find-total-time-spent-by-each-employee/
*/


SELECT
    event_day AS 'day',
    emp_id,
    SUM(mins) AS 'total_time'
FROM (
    SELECT
        *,
        out_time - in_time AS 'mins'
    FROM Employees
) temp
GROUP BY event_day, emp_id;