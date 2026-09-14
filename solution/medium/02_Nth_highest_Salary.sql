-- LeetCode #176: Highest second salary
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).
--
-- Approach:
-- Subquery and max
-- 
--
-- Pattern:
-- Subquery , max and where
--
-- Solution:
select max(distinct salary) as SecondHighestSalary 
from Employee 
where salary < (select  max(distinct salary) as SecondHighestSalary  from Employee)
