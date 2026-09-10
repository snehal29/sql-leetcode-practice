-- LeetCode #627: Swap Sex of Employees
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement 
-- and no intermediate temporary tables.
--
--
-- Approach:
-- Update statement with Case statement
-- 
-- Pattern:
--  Update , case
--
-- Solution:
Update Salary set sex = case
  when sex='f' then 'm'
  when sex='m' then 'f'
end
