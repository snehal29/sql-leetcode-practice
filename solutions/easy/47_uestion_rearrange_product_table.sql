-- LeetCode #1795. Rearrange Products Table
--
-- Problem:Write a solution to rearrange the Products table so that each row has (product_id, store, price).
-- If a product is not available in a store, do not include a row with that product_id and store combination in the result table.
--
-- Approach: UNION ALL because did seperate select for each store and combine it
--
-- Pattern:
-- UNION ALL , NOT NULL , WHERE clause
--
-- Solution:
Select product_id, 'store1' as store, store1 as price
from Products
where store1 is not null  
union all 
Select product_id , 'store2'as store , store2 as price
from Products
where store2 is not null
union all
Select product_id , 'store3' as store , store3 as price

 

--Solution in pandas-- 
-- 
-- ABOUT Melt() : The melt() function is used to transform a dataframe from a "wide" format (where data is spread out across multiple columns) 
-- into a "long" format (where data is stacked vertically into rows).
--1. id_vars (The Anchors): Columns you want to keep exactly as they are. They will repeat for every row that gets created. (e.g., product_id)
--2. value_vars (The Targets): The specific columns you want to collapse down into rows. If you don't specify this, pandas will automatically grab all columns not listed in id_vars. (e.g., store1, store2, store3)
--3. var_name (The New Variable Column): The name of the new column that will hold your old column headers. (e.g., 'store')
--4. value_name (The New Value Column): The name of the new column that will hold the actual data cells/numbers. (e.g., 'price')

import pandas as pd

def rearrange_products_table(products: pd.DataFrame) -> pd.DataFrame:
    df = pd.melt(products, id_vars='product_id',var_name='store' ,value_name='price').dropna()
    return df
    
