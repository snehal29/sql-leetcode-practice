-- LeetCode #1378: Replace Employee ID With The Unique Identifier
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
--
-- Approach:
--  Left join on id
--
-- Pattern: LEFT JOIN
--
--
-- Solution:
select e.unique_id , emp.name 
from Employees emp 
left join EmployeeUNI e
on emp.id = e.id
