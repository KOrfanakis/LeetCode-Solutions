/*
LeetCode 184. Department Highest Salary
https://leetcode.com/problems/department-highest-salary/
*/


SELECT
    Department.name AS 'Department',
    Employee.name AS 'Employee',
    salary AS 'Salary'
FROM Employee
    INNER JOIN Department
    ON Employee.departmentId = Department.id
WHERE (Employee.departmentId, salary) IN (
    SELECT departmentId, MAX(salary)
    FROM Employee
    GROUP BY departmentId);