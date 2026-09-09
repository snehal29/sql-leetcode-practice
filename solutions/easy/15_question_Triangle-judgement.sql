-- LeetCode #610: Triangle Judgement
-- Difficulty: Easy
--
-- Problem:
-- Report for every three line segments whether they can form a triangle.
--
--
-- Approach:
--  To find the triangle can form or not needed two sides > than 3rd one so use case when 
-- 
-- Pattern:
-- CASE
--
-- Solution:
select *,
     case when (x+y > z) and (y+z> x) and ( x+z > y)  THEN 'Yes'
     else 'No'
     end as triangle
from Triangle

