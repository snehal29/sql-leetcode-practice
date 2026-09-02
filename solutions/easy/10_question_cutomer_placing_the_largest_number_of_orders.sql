-- LeetCode #584: Customer_placing_the_largest_number_of_orders
-- Difficulty: Easy
--
-- Problem:
--  Write a solution to find the customer_number for the customer who has placed the largest number of orders.
--  
--
-- Approach:
-- use group by on cutomer_number and order by on count , order_number desc and limit 
--
-- Pattern:
-- Group by , order by , count, limit
--
--
-- Solution:
select customer_number  
from Orders 
group by customer_number
order by count(order_number) desc
limit 1
