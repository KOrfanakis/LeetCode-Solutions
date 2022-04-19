/*
LeetCode 601. Human Traffic of Stadium
https://leetcode.com/problems/human-traffic-of-stadium/
*/


WITH stadium_cte AS (
    SELECT 
        *,
        id - ROW_NUMBER() OVER (ORDER BY id) AS 'id_row_diff'
    FROM Stadium
    WHERE people >= 100
)
    
SELECT id, visit_date, people
FROM stadium_cte
WHERE id_row_diff IN (
    SELECT id_row_diff
    FROM stadium_cte
    GROUP BY id_row_diff
    HAVING COUNT(*) > 2
);