-- LeetCode #620: Not boring Movie
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring". Return the result table ordered by rating in descending order.
--
--
-- Approach:
-- id%2 and NOT IN 
-- 
-- Pattern:
-- where , % , NOT IN
--
-- Solution:
select * from Cinema
where id%2 = 1 and description NOT IN ('boring')
order by rating desc
