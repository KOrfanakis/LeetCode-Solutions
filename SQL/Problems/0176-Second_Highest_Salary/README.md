# 176. Second Highest Salary

## Description

Table: `Employee`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
```
`id` is the primary key column for this table. Each row of this table contains information about the salary of an employee.

<br> 

Write an SQL query to report the second highest salary from the `Employee` table. If there is no second highest salary, the query should report `null`.

<br>

## Solutions

### Solution #01: Using a Noncorrelated Subquery

```sql
SELECT MAX(salary) AS 'SecondHighestSalary'
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
```

<br> 

### Solution #02: Using a Correlated Subquery

```sql
SELECT
    IFNULL(
        (SELECT DISTINCT(salary)
         FROM Employee e1
         WHERE 1 = (SELECT COUNT(*)
                    FROM Employee e2
                    WHERE e2.salary > e1.salary)),
        Null
    ) AS 'SecondHighestSalary';
```

<br> 

### Solution #03: Using LIMIT + OFFSET

```sql
SELECT
    IFNULL(
        (SELECT DISTINCT(salary)
         FROM Employee
         ORDER BY salary DESC
         LIMIT 1 OFFSET 1),
        NULL
    ) AS 'SecondHighestSalary';
```

<br>

## Examples

### Example 1:

**Input**:

`Employee` table:
```
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
```
**Output**:
```
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
```

### Example 2:

**Input**:

`Employee` table:
```
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
```
**Output**:
```
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
```
