# 180. Consecutive Numbers

## Description

Table: `Logs`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
```
`id` is the primary key for this table. `id` is an autoincrement column.

 <br>

Write an SQL query to find all numbers that appear at least three times consecutively. Return the result table in **any order**.

<br>

## Solution

```sql
WITH logs_lag_lead AS (
    SELECT
        id,
        num,
        LAG(num) OVER (ORDER BY id) AS lag_num,
        LEAD(num) OVER (ORDER BY id) AS lead_num
    FROM Logs)

SELECT DISTINCT(num) AS 'ConsecutiveNums'
FROM logs_lag_lead
WHERE num = lag_num AND num = lead_num;
```

<br>

## Example

**Input**:

`Logs` table:
```
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
```
**Output**:
```
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
```
**Explanation**:

1 is the only number that appears consecutively for at least three times.
