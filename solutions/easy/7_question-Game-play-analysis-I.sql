-- LeetCode #511:Game play analysis I
-- Difficulty: Easy
--
-- Problem:
--  Write a solution to find the first login date for each player.
--
-- Approach:1
-- Use ROW_NUMBER for marking rank for each player and get only rank 1 
-- Approach:2
-- Use Group by on playerid and min() on event_date 
--
-- Pattern:
-- ROW_NUMBER() 
-- Group BY and MIN() 
--
-- Solution: 1
select player_id , event_date as first_login
from (select player_id , event_date ,
ROW_NUMBER() Over(partition by player_id order by event_date) rnk
from Activity) t
where rnk = 1

-- Solution: 2
select player_id , min(event_date) as first_login
from Activity
group by player_id
