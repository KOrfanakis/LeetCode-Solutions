# 1050. Actors and Directors Who Cooperated At Least Three Times

## Description

Table: `ActorDirector`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |
+-------------+---------+
```
`timestamp` is the primary key column for this table.

 <br>

Write a SQL query for a report that provides the pairs `(actor_id, director_id)` where the actor has cooperated with the director at least three times.

Return the result table in **any order**.

<br>

## Solution

### Solution #01: Using GROUP BY + HAVING:

```sql
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;
```

<br>

### #02: Using PARTITION BY:

```sql
SELECT DISTINCT(actor_id), director_id
FROM (
    SELECT
        actor_id,
        director_id,
        COUNT(timestamp) OVER (PARTITION BY actor_id, director_id) AS num
    FROM ActorDirector) AS temp
WHERE num >= 3;
```

<br>

Alternatively, we can rewrite the previous solution using a CTE:

```sql
WITH cte AS (
    SELECT
        actor_id,
        director_id,
        COUNT(timestamp) OVER (PARTITION BY actor_id, director_id) AS num
    FROM ActorDirector)
    
SELECT DISTINCT(actor_id), director_id
FROM cte
WHERE num >= 3;
```

<br>

## Example:

**Input**:

`ActorDirector` table:
```
+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+
```
**Output**:
```
+-------------+-------------+
| actor_id    | director_id |
+-------------+-------------+
| 1           | 1           |
+-------------+-------------+
```
**Explanation**:

The only pair is `(1, 1)` where they cooperated exactly 3 times.
