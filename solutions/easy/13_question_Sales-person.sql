-- LeetCode #607: Sales person
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".
--
-- Approach:
-- NOT Exists and join
-- 
-- Pattern:
-- outer query and not exists inner query result
--
-- Solution:
SELECT s.name
FROM SalesPerson s
WHERE NOT EXISTS (
SELECT 1
FROM Orders o
JOIN Company c
ON o.com_id = c.com_id
WHERE o.sales_id = s.sales_id
AND c.name = 'RED')
