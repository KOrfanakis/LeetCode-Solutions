/*
LeetCode 1084. Sales Analysis III
https://leetcode.com/problems/bank-account-summary-ii/
*/


SELECT
    name,
    SUM(amount) AS 'balance'
FROM Transactions
    LEFT JOIN Users
    USING (account)
GROUP BY account
HAVING SUM(amount) > 10000;