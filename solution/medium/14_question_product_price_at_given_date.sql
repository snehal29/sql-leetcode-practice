-- LeetCode #1164. Product Price at a Given Date
-- Difficulty: Medium
--
-- Problem: Initially, all products have price 10. Write a solution to find the prices of all products on the date 2019-08-16.
--
-- Approach:  SUBQUERY to find the price with the given date and less than that if not use coalsce function for rest of the price is 10 
--
-- Pattern: SUBQUERY , COALSCE , WHERE , AND , ORDER BY , LIMIT , DISTINCT
-- 
--
-- Solution:
select p.product_id,
    coalesce((select p1.new_price from products p1
                where p.product_id=p1.product_id and p1.change_date <='2019-08-16'
                order by p1.change_date desc limit 1),10) as price
    from (select distinct product_id from products) as p

---------------------
--Panda solution--- 
-- approach : 

    
