-- LeetCode #1729: Find Followers Count
-- Difficulty: Easy
--
-- Problem: Write a solution that will, for each user, return the number of followers.
-- Return the result table ordered by user_id in ascending order.
--
-- Approach: 
-- Group by on user_id and order by on user_id ascending also we need count of followers
--
-- Pattern:
-- Group by , orderby , count
--
-- Solution:
Select user_id , count(follower_id) as followers_count
from Followers 
group by user_id 
order by user_id asc
 

--Solution in pandas--
import pandas as pd

def count_followers(followers: pd.DataFrame) -> pd.DataFrame:
    df = followers.groupby('user_id')['follower_id'].count().reset_index(name ='followers_count')
    df = df.sort_values('user_id', ascending=True)
    return df[['user_id','followers_count']]
    

    
    
    

    
