# 596. Classes More Than 5 Students

## Description

Table: `Courses`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
```
(`student`, `class`) is the primary key column for this table. Each row of this table indicates the name of a student and the class in which they are enrolled.

 <br>

Write an SQL query to report all the classes that have at least five students. Return the result table in **any order**.

<br>

## Solutions

### Solution #01: Using GROUP BY + HAVING

```sql
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
```

<br>

### Solution #02: Using a Subquery + GROUP BY

```sql
SELECT class
FROM
    (SELECT class, COUNT(DISTINCT student) AS num_of_students
     FROM courses
     GROUP BY class) AS temp_table
WHERE num_of_students >= 5;
```

<br>

## Example

**Input**: 

`Courses` table:
```
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+
```
**Output**:
```
+---------+
| class   |
+---------+
| Math    |
+---------+
```
**Explanation**:

- Math has 6 students, so we include it.
- English has 1 student, so we do not include it.
- Biology has 1 student, so we do not include it.
- Computer has 1 student, so we do not include it.
