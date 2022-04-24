/*
LeetCode 1527. Patients With a Condition
https://leetcode.com/problems/patients-with-a-condition/
*/


-- Solution #01: Using LIKE

SELECT *
FROM Patients
WHERE 
    conditions LIKE 'DIAB1%' OR 
    conditions LIKE '% DIAB1%';


-- Solution #02: Using a Regular Expression

SELECT *
FROM Patients
WHERE conditions REGEXP '\\bDIAB1';