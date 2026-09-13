-- LeetCode #1068:  Product sales analysis I
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
--
-- Approach:
-- Inner Join
-- 
-- Pattern:
-- Inner Join
--
-- Solution:
select p.product_name , s.year , s.price
from Sales s 
inner join Product p
on p.product_id = s.product_id
