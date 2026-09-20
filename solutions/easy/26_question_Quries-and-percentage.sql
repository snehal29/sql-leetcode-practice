-- LeetCode #1211: quries quality and percentage
-- Difficulty: Easy
--
-- Problem:
-- We define query quality as: The average of the ratio between query rating and its position.
-- We also define poor query percentage as: The percentage of all queries with rating less than 3.
-- Write a solution to find each query_name, the quality and poor_query_percentage.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.
-- Explanation: 
-- Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
-- Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33

-- Cat queries quality equals ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
-- Cat queries poor_ query_percentage is (1 / 3) * 100 = 33.33
-- Approach:
-- So use group by for identifying the quality_name per group , use round() function also sum() , case when 
--
-- Pattern:
-- WHERE and  ORDER BY
--
-- Solution:
select distinct author_id as id from Views 
where author_id = viewer_id 
order by author_id 
