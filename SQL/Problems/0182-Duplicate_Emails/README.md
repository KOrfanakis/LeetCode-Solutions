# 182. Duplicate Emails

## Description

Table: `Person`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
```
`id` is the primary key column for this table. Each row of this table contains an email. The emails will not contain uppercase letters.

 <br>

Write an SQL query to report all the duplicate emails. Return the result table in **any order**.

<br>

## Solution

### Solution #01: Using GROUP BY:
```sql
SELECT email AS 'Email'
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;
```
### Solution #02: Using a Self Join
```sql
SELECT DISTINCT p1.email AS 'Email'
FROM Person p1, Person p2
WHERE p1.email = p2.email AND p1.id != p2.id;
```

### Solution #03: Using a Temporary Table
```sql
SELECT email AS 'Email'
FROM (
    SELECT email, COUNT(*) AS num
    FROM Person
    GROUP BY email
) AS groupby
WHERE num > 1;
```

<br>

## Example

**Input**:

`Person` table:
```
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
```
**Output**: 
```
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
```
**Explanation**: 

a@b.com is repeated two times.
