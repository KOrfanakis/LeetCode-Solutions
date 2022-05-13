/*
LeetCode 1179. Reformat Department Table
https://leetcode.com/problems/reformat-department-table/
*/


-- Goal: Manually pivot the table.
-- For each month, use IF to either return `revenue` or NULL.
-- GROUP BY id (+ SUM) so that revenues from the same id appear in the same row.


SELECT 
    id, 
    SUM( IF( month = 'Jan', revenue, NULL ) ) AS Jan_Revenue,
    SUM( IF( month = 'Feb', revenue, NULL ) ) AS Feb_Revenue,
    SUM( IF( month = 'Mar', revenue, NULL ) ) AS Mar_Revenue,
    SUM( IF( month = 'Apr', revenue, NULL ) ) AS Apr_Revenue,
    SUM( IF( month = 'May', revenue, NULL ) ) AS May_Revenue,
    SUM( IF( month = 'Jun', revenue, NULL ) ) AS Jun_Revenue,
    SUM( IF( month = 'Jul', revenue, NULL ) ) AS Jul_Revenue,
    SUM( IF( month = 'Aug', revenue, NULL ) ) AS Aug_Revenue,
    SUM( IF( month = 'Sep', revenue, NULL ) ) AS Sep_Revenue,
    SUM( IF( month = 'Oct', revenue, NULL ) ) AS Oct_Revenue,
    SUM( IF( month = 'Nov', revenue, NULL ) ) AS Nov_Revenue,
    SUM( IF( month = 'Dec', revenue, NULL ) ) AS Dec_Revenue
FROM Department
GROUP BY id;