/*
LeetCode 586. Customer Placing the Largest Number of Orders
https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
*/


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