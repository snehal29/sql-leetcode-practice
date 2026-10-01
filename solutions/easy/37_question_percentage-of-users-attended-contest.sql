-- LeetCode #1633: Percentage of Users Attended a Contest
-- Difficulty: Easy
--
-- Problem: Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
--  Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
--
-- Approach: 
--  Inner join on user_id and group by on cotest_id and order by parcentage desc and contest_id asce 
--  to find percentage needed count of user_id into that with 100 and divide as total count of users and round it to 2 digits
--
-- Pattern:
-- Inner join , group by , order by , round , count 
--
-- Solution:
Select r.contest_id,
round(count(distinct u.user_id)*100/(select count(*) from users),2) as percentage
from users u
inner join register r
on u.user_id = r.user_id
group by r.contest_id
order by percentage desc , r.contest_id asc
 

--Solution in pandas--
import pandas as pd

def users_percentage(users: pd.DataFrame, register: pd.DataFrame) -> pd.DataFrame:
    df_join = users.merge(register , on ='user_id',how ='inner')
    df_group= df_join.groupby('contest_id').agg(count=('user_id','count')).reset_index()
    df_group['percentage'] =(df_group['count']*100/len(users)).round(2)
    df = df_group[['contest_id','percentage']].sort_values(by=['percentage','contest_id'],ascending =[False,True])
    return df
    
    

    
