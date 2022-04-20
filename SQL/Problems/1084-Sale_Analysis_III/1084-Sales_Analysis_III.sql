/*
LeetCode 1084. Sales Analysis III
https://leetcode.com/problems/sales-analysis-iii/
*/


-- Solution #01: Using an Uncorrelated Subquery

SELECT product_id, product_name
FROM Product
WHERE product_id NOT IN (
    SELECT product_id
    FROM sales
    WHERE sale_date <'2019-01-01' OR sale_date >'2019-03-31'
);


-- Solution #02: Using JOIN + GROUP BY

WITH sales_complete_cte AS (
    SELECT *
    FROM Sales
        LEFT JOIN Product
        USING(product_id)
)

SELECT product_id, product_name
FROM sales_complete_cte
GROUP BY product_id
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31';