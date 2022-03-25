/*
LeetCode 185. Department Top Three Salaries
https://leetcode.com/problems/department-top-three-salaries/
*/


WITH join_cte AS (
    SELECT 
        d.name AS 'Department',
        e.name AS 'Employee',
        e.salary AS 'Salary',
        DENSE_RANK() over (PARTITION BY d.name ORDER BY e.salary DESC) AS 'Rank'
    FROM Employee e
        INNER JOIN Department d
        ON e.departmentId = d.id
)


SELECT Department, Employee, Salary
FROM join_cte
WHERE join_cte.Rank < 4;