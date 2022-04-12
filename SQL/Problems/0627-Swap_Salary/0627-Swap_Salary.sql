/*
LeetCode 627. Swap Salary
https://leetcode.com/problems/swap-salary/
*/


-- Solution #01: Using CASE

UPDATE Salary
SET
    sex = CASE sex
            WHEN 'm' THEN 'f'
            ELSE 'm'
          END;
    

-- Solution #02: Using IF

UPDATE Salary
SET sex = IF(sex='m', 'f', 'm')


-- Solution #03: Using REPLACE

UPDATE Salary
SET sex = REPLACE('fm', sex, '');