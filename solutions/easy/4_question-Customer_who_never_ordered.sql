-- LeetCode #183:Customers Who Never Order
-- Difficulty: Easy
--
-- Problem:
--  Write a solution to find all customers who never order anything
--
-- Approach:
-- Use left join and IS NULL on custmerId column 
--
-- Pattern:
-- LEFT JOIN and IS NULL 
--
--
-- Solution:
select c.name as Customers from Customers c
left join Orders o 
on c.id=o.customerId
where o.customerId is NULL;
