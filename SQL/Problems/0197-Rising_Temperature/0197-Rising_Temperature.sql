/*
LeetCode 197. Rising Temperature
https://leetcode.com/problems/rising-temperature/
*/


-- Solution #01: Using LAG

SELECT id
FROM (
    SELECT
        *,
        LAG(temperature) OVER (ORDER BY recordDate) AS 'previous_temperature',
        DATEDIFF(recordDate, LAG(recordDate) OVER (ORDER BY recordDate)) AS 'date_diff'
    FROM Weather
) AS temp
WHERE
    temperature > previous_temperature AND
    date_diff = 1;



-- Solution #02: Using DATEDIFF

SELECT w1.id
FROM weather w1, weather w2
WHERE 
    DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND
    w1.temperature > w2.temperature;


-- Solution #03: Using TO_DAYS

SELECT w1.id
FROM weather w1
    INNER JOIN weather w2
    ON TO_DAYS(w1.recordDate) = TO_DAYS(w2.recordDate) + 1
WHERE w1.temperature > w2.temperature;