-- LeetCode #177: Nth Highest  salary
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.
--
-- Approach:
-- Window function - dense_rank 
-- 
--
-- Pattern:
-- DENSE_RANK()
--
-- Solution:
select max(distinct salary) as SecondHighestSalary 
from Employee 
where salary < (select  max(distinct salary) as SecondHighestSalary  from Employee)
