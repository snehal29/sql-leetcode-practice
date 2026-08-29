-- LeetCode #197: Rising Temperatures
-- Difficulty: Easy
--
-- Problem:
-- find all dates' id with higher temperatures compared to its previous dates (yesterday).
--
-- Approach:
-- we need id only so select id 
-- we need to check the previous date and current date temperature so window function LAG() we have to use
-- Then in where compare greater temperature and date difference should be 1 
-- 
-- Pattern:
-- Window function LAG() on temperature and recordDate
-- Where and DATEDIFF()
--
-- Solution:
Select id 
from 
(
    select id , temperature , recordDate ,
    LAG(temperature) over(order by recordDate) as pre_temp ,
    LAG(recordDate) over(order by recordDate) as pre_date
    from Weather
)t
where temperature > t.pre_temp 
and DATEDIFF(recordDate , pre_date)= 1

--Approach 2:
-- Use self join and same conditions
--
-- Pattern:
-- Self Join , DATEDIFF() 
--
-- Solution:
select w1.id from Weather w1 
join Weather w2 
on DATEDIFF(w1.recordDate , w2.recordDate) =1
where w1.temperature > w2.temperature
