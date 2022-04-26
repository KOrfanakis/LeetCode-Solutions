/*
LeetCode 1581. Customer Who Visited but Did Not Make Any Transactions
https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
*/


-- Solution #01: Using a JOIN

WITH joined_tables_cte AS (
    SELECT *
    FROM Visits
        LEFT JOIN Transactions
        USING (visit_id)        
)

SELECT
    customer_id,
    COUNT(*) AS 'count_no_trans'
FROM joined_tables_cte
WHERE amount IS NULL
GROUP BY customer_id;


-- Solution #02: Using a Subquery

SELECT
    customer_id,
    COUNT(*) AS 'count_no_trans'
FROM Visits
WHERE visit_id NOT IN (
    SELECT visit_id
    FROM Transactions
)
GROUP BY customer_id;