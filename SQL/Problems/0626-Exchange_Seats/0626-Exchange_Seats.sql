/*
LeetCode 626. Exchange Seats
https://leetcode.com/problems/exchange-seats/
*/


-- Solution #01: Using the LAG and LEAD Window Functions

WITH seat_lag_lead_student AS (
    SELECT 
        id,
        student,
        LAG(student) OVER (ORDER BY id) AS lag_st,
        LEAD(student) OVER (ORDER BY id) AS lead_st
    FROM Seat
)

SELECT 
    id,
    CASE 
        WHEN MOD(id, 2) = 0 THEN lag_st
        ELSE COALESCE (lead_st, student) 
    END AS Student
from seat_lag_lead_studentl;


-- Solution #02: Using a Self Join

SELECT
    s1.id AS id,
    COALESCE (s2.student, s1.student) AS student
FROM Seat s1
    LEFT JOIN Seat s2
    ON
        (s1.id = s2.id - 1 AND MOD(s1.id, 2) = 1) OR 
        (s1.id = s2.id + 1 AND MOD(s1.id, 2) = 0);


-- Solution #03: Using CASE

SELECT
    (CASE
        WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1
        WHEN MOD(id, 2) != 0 AND counts = id THEN id
        ELSE id - 1
    END) AS id,
    student
FROM
    Seat,
    (SELECT COUNT(*) AS counts
     FROM seat) AS seat_counts
ORDER BY id ASC;