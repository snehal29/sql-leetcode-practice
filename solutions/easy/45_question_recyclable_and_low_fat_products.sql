-- LeetCode #1741: Find Total Time Spent by Each Employee
--
-- Problem: Write a solution to find the ids of products that are both low fat and recyclable.
--
-- Approach: 
--  Use Where clause also and both conditions 
--
-- Pattern:
-- WHERE , AND
--
-- Solution:
select product_id from Products
where low_fats ='Y' and recyclable ='Y'

 

--Solution in pandas--
import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    df = products[(products['low_fats']=='Y') & (products['recyclable']=='Y')] 
    return df[['product_id']]
    
