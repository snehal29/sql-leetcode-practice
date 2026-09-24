-- LeetCode #1251: Average Selling Price
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find the average selling price for each product. 
-- average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0.
--
--
-- Approach:
-- Left join on both tables becuase we needed not sold units as well on product_id and start end date with purchase date for uniquly identify
-- group by on product_id becuase we needed result for each product and 
-- multiple by units and price and sum there after that div them with sum of units after that we needed result in rounded 2 so and 
-- if any unsold value it should be 0 not NULL then use coalesce function for that and alise it as avg price for each product
--
-- Pattern: 
-- Left Join , group by , between , SUM , ROUND , COALESCE    
--
--
-- Solution:
select p.product_id , coalesce(round(sum(u.units*p.price)/sum(u.units),2),0) as average_price
from Prices p
left join UnitsSold u
on p.product_id =u.product_id 
and u.purchase_date between p.start_date and p.end_date 
group by p.product_id 
