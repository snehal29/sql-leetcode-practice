-- LeetCode #181. Employees Earning More Than Their Managers
-- Difficulty: Easy
--
-- Problem:
-- Return  name as Employee 
--
-- Approach:
-- Use Self join on Employee table
-- with condition Employee salary is greater than there manager salary.
--
-- Pattern:
-- SELF JOIN
--
-- Solution:
Select  e.name  as Employee 
from Employee e
join  Employee m
on e.managerID =m.id
where e.salary > m.salary 
