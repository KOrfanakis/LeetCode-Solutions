# 196. Delete Duplicate Emails

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

Write an SQL query to **delete** all the duplicate emails, keeping only one unique email with the smallest `id`. Note that you are supposed to write a `DELETE` statement 
and not a `SELECT` one.

Return the result table in **any order**.

<br>

## Solution

```sql
DELETE p1 
FROM 
    Person p1,
    Person p2
WHERE
    p1.email = p2.email AND p1.id > p2.id;
```

<br>

## Example

**Input**: 

`Person` table:
```
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
```
**Output**: 
```
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
```
**Explanation**: 

john@example.com is repeated two times. We keep the row with the smallest Id = 1.
