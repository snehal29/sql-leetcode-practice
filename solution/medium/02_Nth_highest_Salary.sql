-- LeetCode #177: Nth Highest  salary
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.
--
-- Approach:
-- limit and offset  
-- 
--
-- Pattern:
-- offset and limit
--
-- Solution:
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    set N=N-1;
  RETURN (
      # Write your MySQL query statement below.
     select distinct(salary) from Employee order by salary desc
     limit 1 offset N

  );
END
