/*
LeetCode 1141. User Activity for the Past 30 Days I
https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
*/


SELECT
    activity_date AS 'day',
    COUNT(DISTINCT user_id) AS 'active_users'
FROM activity 
WHERE DATEDIFF('2019-07-27', activity_date) < 30
GROUP BY 1;