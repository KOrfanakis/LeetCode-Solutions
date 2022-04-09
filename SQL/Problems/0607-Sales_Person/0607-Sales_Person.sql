/*
LeetCode 607. Sales Person
https://leetcode.com/problems/sales-person/
*/


-- Solution #01: Using two subqueries

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT sales_id
    FROM Orders
    WHERE com_id IN (
        SELECT com_id
        FROM Company
        WHERE name = 'RED'
    )
);


-- Solution #02: Using a LEFT JOIN + a Subquery

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT sales_id
    FROM Orders
        LEFT JOIN Company
        ON Orders.com_id = Company.com_id
    WHERE Company.name = 'RED'
);