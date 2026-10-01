-- LeetCode #1587: Bank Account Summary II
-- Difficulty: Easy
--
-- Problem:Write a solution to report the name and balance of users with a balance higher than 10000. The balance of an account is equal to the sum of the amounts of all transactions involving that account
--
--
-- Approach: 
--  Inner join on account to get common transactions , grouped on the account , having with sum of amount which is > 10000
--
--
-- Pattern:
-- Inner join , Group by , Having , Sum 
--
-- Solution:
 select u.name  , sum(t.amount) as balance 
 from Users u
 inner join Transactions t
 on u.account = t.account
 group by t.account
 having sum(t.amount) >10000
 

--Solution in pandas--
import pandas as pd

def account_summary(users: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    df_join = users.merge(transactions , on='account',how ='inner' )
    df_group = df_join.groupby(['name','account'])['amount'].sum().reset_index(name='balance')
    df_filter = df_group[df_group['balance']> 10000]
    df = df_filter[['name','balance']]
    return df
    

    
