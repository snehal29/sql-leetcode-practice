-- LeetCode #577: Employee Bonus
-- Difficulty: Easy
--
-- Problem:
--  Write a solution to report the name and bonus amount of each employee who satisfies either of the following:
--          The employee has a bonus less than 1000.
--          The employee did not get any bonus.
--
-- Approach:
-- Use left join and IS NULL  
--
-- Pattern:
-- LEFT JOIN and IS NULL 
--
--
-- Solution:
select e.name , b.bonus 
from Employee e 
left join Bonus b
on e.empId = b.empId
where b.bonus < 1000 or
b.bonus is null
