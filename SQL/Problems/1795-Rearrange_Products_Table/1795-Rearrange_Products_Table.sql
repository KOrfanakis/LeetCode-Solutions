/*
LeetCode 1795. Rearrange Products Table
https://leetcode.com/problems/rearrange-products-table/
*/


SELECT *
FROM (
    SELECT product_id, 'store1' AS store, store1 AS price FROM Products
    UNION
    SELECT product_id, 'store2' AS store, store2 AS price from Products
    UNION
    SELECT product_id, 'store3' AS store, store3 AS price from Products
) AS store_temp
WHERE price IS NOT NULL;