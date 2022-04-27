# 197. Rising Temperature

## Description

Table: `Weather`
```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
```
`id` is the primary key for this table.
This table contains information about the temperature on a certain day.

 <br>

Write an SQL query to find all dates' `Id` with higher temperatures compared to its previous dates (**yesterday**). 
Return the result table in **any order**.

<br>

## Solutions

### Solution #01: Using LAG
```sql
SELECT id
FROM (
    SELECT
        *,
        LAG(temperature) OVER (ORDER BY recordDate) AS 'previous_temperature',
        DATEDIFF(recordDate, LAG(recordDate) OVER (ORDER BY recordDate)) AS 'date_diff'
    FROM Weather
) AS temp
WHERE
    temperature > previous_temperature AND
    date_diff = 1;
```

<br>

### Solution #02: Using DATEDIFF
```sql
SELECT w1.id
FROM weather w1, weather w2
WHERE 
    DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND
    w1.temperature > w2.temperature;
```

<br>

### Solution #03: Using TO_DAYS
```sql
SELECT w1.id
FROM weather w1
    INNER JOIN weather w2
    ON TO_DAYS(w1.recordDate) = TO_DAYS(w2.recordDate) + 1
WHERE w1.temperature > w2.temperature;
```

<br>

## Example

**Input**:

`Weather` table:
```
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
```

**Output**:
```
+----+
| id |
+----+
| 2  |
| 4  |
+----+
```
**Explanation**:

- In `2015-01-02`, the temperature was higher than the previous day (`10 -> 25`).
- In `2015-01-04`, the temperature was higher than the previous day (`20 -> 30`).
