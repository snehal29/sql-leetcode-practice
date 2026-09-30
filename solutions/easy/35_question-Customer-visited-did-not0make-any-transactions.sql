-- LeetCode #1581: Customer Who Visited but Did Not Make Any Transactions
-- Difficulty: Easy
--
-- Problem: Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits. 
--
-- Approach: 
--   I choose the left join beacuse we need to find the visited but not transaction did customers count
--  and group on customer id and where on transaction id is null
-- Pattern:
--  Group by , where , count , left join
--
-- Solution:
select v.customer_id , count(v.visit_id) as count_no_trans 
from Visits v
left join Transactions t
on v.visit_id = t.visit_id 
where t.transaction_id is NULL
group by v.customer_id

--Solution in pandas--
import pandas as pd

def find_customers(visits: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    df_join = visits.merge(transactions , on='visit_id',how='left')
    df_group = df_join[df_join['transaction_id'].isna()].groupby('customer_id')['visit_id'].count().reset_index(name='count_no_trans')
    return df_group[['customer_id','count_no_trans']]

    
