-- LeetCode #1407: Top Travellers
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to report the distance traveled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.
--
-- Approach:
-- Needed columns are name and total travalled distance , for two tables do left join on id ,
-- group by on name and id and order by tranvelled distance is desc and name in asce
--
-- Pattern: 
-- LEFT Join , Group By , Order By , Sum() , Coalesce()
--
-- Solution:
select u.name , coalesce(sum(r.distance),0) as travelled_distance
from Users u
left join Rides r
on u.id=r.user_id
group by u.id,u.name
order by travelled_distance desc , u.name asc 
