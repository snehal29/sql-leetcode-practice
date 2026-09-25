-- LeetCode #1484: Group sold product by the date
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find for each date the number of different products sold and their names.
-- The sold products names for each date should be sorted lexicographically. Return the result table ordered by sell_date.
--
-- Approach:
-- We needed count for each product sold per day so group by sell_date and order by as well
-- Count for product and group_concat for product name seperated by comma
--
--
-- Pattern: 
-- Group By , Order By , Count , Distnict , GROUP_CONCAT    
--
--
-- Solution:
Select sell_date , 
count(distinct product) as num_sold, 
group_concat(distinct product order by product asc separator ',') as products
from Activities
group by sell_date 
order by sell_date
