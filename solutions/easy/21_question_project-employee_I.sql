-- LeetCode #1075: Project Employees I
-- Difficulty: Easy
--
-- Problem:
-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
--
--
-- Approach:
-- Inner Join on employee_id , Group by on project_id , round() , AVG(experience_years)
-- 
-- Pattern:
-- Inner Join , Group by , round() , AVG()
--
-- Solution:
Update Salary set sex = case
  when sex='f' then 'm'
  when sex='m' then 'f'
end
