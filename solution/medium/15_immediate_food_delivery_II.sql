-- LeetCode #1174. Immediate Food Delivery II
-- Difficulty: Medium
--
-- Problem: If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
-- The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.
-- Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
--
-- Approach:  SUBQUERY to get customer_id and min order date and where and IN clause which can be used also for
-- finding the percentage i used the avg and compare the order dates and rounded 2  
--
-- Pattern: SUBQUERY , WHERE , IN 
-- 
--
-- Solution:
select round(avg(order_date =customer_pref_delivery_date)*100,2) as immediate_percentage
from delivery
where (customer_id , order_date) in (select customer_id , min(order_date) from delivery
group by customer_id)

---------------------
--Panda solution--- 
-- approach : 

    
