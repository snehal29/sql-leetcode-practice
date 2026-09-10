-- LeetCode #1050:  Actors and Directors Who Cooperated At Least Three Times
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.
--
--
-- Approach:
-- group by and having count
-- 
-- Pattern:
--  Group by and having and count
--
-- Solution:
select actor_id , director_id 
from ActorDirector
group by actor_id , director_id 
having count(*)>=3
