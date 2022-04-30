/*
LeetCode 1158. Market Analysis I
https://leetcode.com/problems/market-analysis-i/
*/


SELECT
    user_id AS buyer_id,
    join_date,
    COALESCE(orders_in_2019, 0) AS 'orders_in_2019'
FROM Users
    LEFT JOIN (
        SELECT buyer_id, COUNT(*) 'orders_in_2019'
        FROM Orders
        WHERE YEAR(order_date) = 2019
        GROUP BY buyer_id
    ) AS Orders
    ON Orders.buyer_id = Users.user_id;