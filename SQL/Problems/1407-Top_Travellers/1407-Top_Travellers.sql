/*
LeetCode 1407. Top Travellers
https://leetcode.com/problems/top-travellers/
*/


SELECT
    name,
    IFNULL(SUM(distance), 0) AS 'travelled_distance'
FROM Users
    LEFT JOIN Rides
    ON Rides.user_id = Users.id
GROUP BY name
ORDER BY travelled_distance DESC, name ASC;