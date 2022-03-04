# 181. Employees Earning More Than Their Managers

## Description

Table: `Employee`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
```
`id` is the primary key column for this table. Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.

<br>

Write an SQL query to find the employees who earn more than their managers. Return the result table in **any order**.

<br>

## Solutions

### Solution #01: Using a Self-Join
```sql
SELECT e1.name AS 'Employee'
FROM Employee e1
    INNER JOIN Employee e2
    on e1.managerId = e2.id
WHERE e1.salary > e2.salary;
```

### Solution #02: Using EXISTS and a Correlated Subquery
```sql
SELECT name AS 'Employee'
FROM Employee e1
WHERE EXISTS (
    SELECT 1
    FROM Employee e2
    WHERE e1.managerId = e2.id AND e1.salary > e2.salary);
```

<br>

## Example

**Input**:

`Employee` table:
```
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
```
**Output**:
```
+----------+
| Employee |
+----------+
| Joe      |
+----------+
```
**Explanation**:

Joe is the only employee who earns more than his manager.
