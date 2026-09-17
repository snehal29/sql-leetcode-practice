-- LeetCode #1084: Sales Analysis III
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.
--
-- Approach:
-- Inner Join on employee_id , Group by on project_id , round() , AVG(experience_years)
-- 
-- Pattern:
-- Inner Join , Group by , round() , AVG()
--
-- Solution:
select p.project_id , round(avg(e.experience_years),2) as average_years 
from Project p
inner join Employee e
on e.employee_id = p.employee_id
group by project_id
