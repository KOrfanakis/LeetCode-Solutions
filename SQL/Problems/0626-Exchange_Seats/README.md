# 626. Exchange Seats

## Description

Table: `Seat`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
```
`id` is the primary key column for this table. Each row of this table indicates the name and the ID of a student. `id` is a continuous increment.

 <br>

Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by `id` in **ascending order**.

<br>

## Solutions:

### Solution #01: Using the LAG and LEAD Window Functions
```sql
WITH seat_lag_lead_student AS (
    SELECT 
        id,
        student,
        LAG(student) OVER (ORDER BY id) AS lag_st,
        LEAD(student) OVER (ORDER BY id) AS lead_st
    FROM Seat
)

SELECT 
    id,
    CASE 
        WHEN MOD(id, 2) = 0 THEN lag_st
        ELSE COALESCE (lead_st, student) 
    END AS Student
from seat_lag_lead_studentl;
```

<br>

### Solution #02: Using a Self Join
```sql
SELECT
    s1.id AS id,
    COALESCE (s2.student, s1.student) AS student
FROM Seat s1
    LEFT JOIN Seat s2
    ON
        (s1.id = s2.id - 1 AND MOD(s1.id, 2) = 1) OR 
        (s1.id = s2.id + 1 AND MOD(s1.id, 2) = 0);
```

<br>

### Solution #03: Using CASE
```sql
SELECT
    (CASE
        WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1
        WHEN MOD(id, 2) != 0 AND counts = id THEN id
        ELSE id - 1
    END) AS id,
    student
FROM
    Seat,
    (SELECT COUNT(*) AS counts
     FROM seat) AS seat_counts
ORDER BY id ASC;
```

<br>

## Example:

**Input**:

`Seat` table:
```
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
```
**Output**:
```
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
```
**Explanation**:

Note that if the number of students is odd, there is no need to change the last one's seat.
