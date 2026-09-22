-- LeetCode #1327: List the Products Ordered in a Period
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
--
-- Approach:
-- Use inner join on product+id column and then where on order date after that group by on product_name after that having clause on sum() >=100
--
-- Pattern:
-- Inner Join , where , group by and having and SUM() and Date function year and month
--
-- Solution:
select p.product_name , sum(o.unit) as unit
from Products p
inner join Orders o
on p.product_id =o.product_id
where year(o.order_date)='2020' and month(o.order_date)='02'
group by p.product_name
having sum(o.unit) >=100
