-- LeetCode #1211: quries quality and percentage
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find all the authors that viewed at least one of their own articles.
--
-- Return the result table sorted by id in ascending order.
--
-- Approach:
-- compare the authore and viewer ids and sort them in sceding order 
--
-- Pattern:
-- WHERE and  ORDER BY
--
-- Solution:
select distinct author_id as id from Views 
where author_id = viewer_id 
order by author_id 
