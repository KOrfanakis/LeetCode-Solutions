/*
LeetCode 183. Customers Who Never Order
https://leetcode.com/problems/customers-who-never-order/
*/


-- Solution #01: Using a Noncorrelated Subquery

SELECT name AS 'Customers'
FROM Customers
WHERE id NOT IN (
    SELECT customerId
    FROM Orders);


-- Solution #02: Using a LEFT JOIN

SELECT name AS 'Customers'
FROM Customers
    LEFT JOIN Orders
    ON Customers.id = Orders.customerId
WHERE Orders.customerId IS NULL;