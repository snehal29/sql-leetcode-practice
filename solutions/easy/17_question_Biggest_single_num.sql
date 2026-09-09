-- LeetCode #619: Biggest Single Number
-- Difficulty: Easy
--
-- Problem:
-- A single number is a number that appeared only once in the MyNumbers table. Find the largest single number. If there is no single number, report null.
--
--
-- Approach:
--  Subquery with group by and having , count and main query max
-- 
-- Pattern:
--  max , group by , having , count 
--
-- Solution:
select max(num) as num from
(select num
from MyNumbers
group by num
having count(*) =1 ) t
