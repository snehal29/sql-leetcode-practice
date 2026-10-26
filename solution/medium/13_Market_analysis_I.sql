-- LeetCode #1158. Market Analysis I
-- Difficulty: Medium
--
-- Problem:Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.
-- user_id is the primary key (column with unique values) of this table.This table has the info of the users of an online shopping website where users can sell and buy items.
-- order_id is the primary key (column with unique values) of this table.item_id is a foreign key (reference column) to the Items table.buyer_id and seller_id are foreign keys to the Users table.
-- item_id is the primary key (column with unique values) of this table.
--
-- Approach:  Left join on the user_id and buyer_id also for year 2019 and Group by for 
--
-- Pattern:LEFT JOIN , GROUP BY , COUNT
-- 
--
-- Solution:
Select u.user_id as buyer_id, u.join_date , count(o.buyer_id) as "orders_in_2019"
from users u
left join orders o
on u.user_id = o.buyer_id and o.order_date <= "2019-12-31" and o.order_date >= "2019-01-01"
group by u.user_id

---------------------
--Panda solution--- 
-- approach : 
import pandas as pd

def market_analysis(users: pd.DataFrame, orders: pd.DataFrame, items: pd.DataFrame) -> pd.DataFrame:
    df_gp = (orders[orders['order_date'].dt.year ==2019].groupby('buyer_id').size().reset_index(name='orders_in_2019'))
    df = pd.merge(users , df_gp, how='left', left_on='user_id',right_on='buyer_id')
    df['orders_in_2019']=df['orders_in_2019'].fillna(0)
    return df[['user_id','join_date','orders_in_2019']].rename(columns={'user_id':'buyer_id'})
    
