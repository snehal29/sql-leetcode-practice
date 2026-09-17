-- LeetCode #1084: Sales Analysis III
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.
--
-- Approach:
-- LEFT JOIN , GROUP BY on product_id and MIN and MAX function with HAVING 
-- 
-- Pattern:
-- LEFT JOIN and GROUP BY also MIN() , MAX() 
--
-- Solution:
SELECT p.product_id , p.product_name
FROM Product p
LEFT JOIN Sales s
ON p.product_id = s.product_id
GROUP BY s.product_id
HAVING MIN(s.sale_date) >= '2019-01-01' AND MAX(s.sale_date)<= '2019-03-31';
