-- LeetCode #1070. Product Sales Analysis III
-- Difficulty: Medium
--
-- Problem:
-- Write a solution to find all sales that occurred in the first year each product was sold.
-- For each product_id, identify the earliest year it appears in the Sales table.
-- Return all sales entries for that product in that year.
-- Return a table with the following columns: product_id, first_year, quantity, and price.
-- Return the result in any order.
--
-- Approach: Used subquery for product_id , year and group on product_id and compared with product_id and year
--
-- Pattern:
-- SUBQUERY , GROUP BY , MIN , IN
--
-- Solution:
select product_id , year as first_year, quantity , price
from Sales 
where (product_id,year) IN (
    select product_id , min(year) 
    from Sales 
    group by product_id
) 

---------------------
--Panda solution--- 
-- approach : 1st group by productId and min year then compare both year and first_year 
import pandas as pd

def sales_analysis(sales: pd.DataFrame) -> pd.DataFrame:
    sales['first_year'] = sales.groupby('product_id')['year'].transform('min')
    df = sales[sales['year']==sales['first_year']]
    return df[['product_id','first_year','quantity','price']]
