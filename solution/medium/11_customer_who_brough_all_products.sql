-- LeetCode #1045. Customers Who Bought All Products
-- Difficulty: Medium
--
-- Problem:
-- Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
--
-- Approach: Used subquery for product_key count and outer compare with it after grouping on customer_id
--
-- Pattern:
-- SUBQUERY , GROUP BY , HAVING , COUNT 
--
-- Solution:
select distinct customer_id from customer 
group by customer_id 
having count(distinct product_key) = (select count(product_key) from product)

---------------------
--Panda solution--- 
-- approach : count all product on product_key , group and count all cutomers with product_key unique() , compare both and return the cutomer_id
import pandas as pd

def find_customers(customer: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:
    p_count = product['product_key'].nunique() 
    df = customer.groupby('customer_id')['product_key'].nunique()
    result = df[df == p_count].index
    return pd.DataFrame({'customer_id': result})
