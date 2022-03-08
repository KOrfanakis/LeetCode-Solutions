# 183. Customers Who Never Order

## Description

Table: `Customers`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
```
`id` is the primary key column for this table. Each row of this table indicates the ID and name of a customer.

<br>

Table: `Orders`
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
```
`id` is the primary key column for this table. `customerId` is a foreign key of the ID from the Customers table. Each row of this table indicates the ID of an order and the ID of the customer who ordered it.

 <br>

Write an SQL query to report all customers who never order anything. Return the result table in **any order**.

<br>

## Solutions

### Solution #01: Using a Noncorrelated Subquery

```sql
SELECT name AS 'Customers'
FROM Customers
WHERE id NOT IN (
    SELECT customerId
    FROM Orders);
```

### Solution #02: Using a LEFT JOIN

```sql
SELECT name AS 'Customers'
FROM Customers
    LEFT JOIN Orders
    ON Customers.id = Orders.customerId
WHERE Orders.customerId IS NULL;
```

<br>

## Example

**Input**: 

`Customers` table:
```
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
```
`Orders` table:
```
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
```
**Output**:
```
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
```
