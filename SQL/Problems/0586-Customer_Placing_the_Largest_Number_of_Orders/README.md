# 586. Customer Placing the Largest Number of Orders

## Description

Table: `Orders`
```
+-----------------+----------+
| Column Name     | Type     |
+-----------------+----------+
| order_number    | int      |
| customer_number | int      |
+-----------------+----------+
```
`order_number` is the primary key for this table.
This table contains information about the order ID and the customer ID.

 <br>

Write an SQL query to find the `customer_number` for the customer who has placed **the largest number of orders**.

The test cases are generated so that **exactly one customer** will have placed more orders than any other customer.

<br>

## Solution

```sql
WITH orders_per_customer AS (
    SELECT customer_number, COUNT(*) AS 'num_of_orders'
    FROM Orders
    GROUP BY customer_number
)

SELECT customer_number
FROM orders_per_customer
WHERE num_of_orders = (
    SELECT MAX(num_of_orders)
    FROM orders_per_customer
);
```

<br>

## Examples

**Input**:

`Orders` table:
```
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
```
`Output`:
```
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
```
**Explanation**:

The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.
