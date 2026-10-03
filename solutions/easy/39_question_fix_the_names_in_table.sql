-- LeetCode #1667: Fix Names in a Table
-- Difficulty: Easy
--
-- Problem: Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
--  Return the result table ordered by user_id.
--
-- Approach: 
-- use substring for getting 1st letter , do upper case on it and use subsubstring on rest letter of name do lower case and cocat all upper and lower case of name
-- order by user_id
--
-- Pattern:
-- Concat , substring , upper , lower and order by
--
-- Solution:
select user_id , 
concat(substring(upper(name) , 1,1),substring(lower(name),2)) as name from Users 
order by user_id
 

--Solution in pandas--
import pandas as pd

def get_average_time(activity: pd.DataFrame) -> pd.DataFrame:
    start = activity[activity['activity_type']=='start']
    end = activity[activity['activity_type']=='end']
    start1= start.groupby('machine_id')['timestamp'].mean()
    end1=end.groupby('machine_id')['timestamp'].mean()
    result =(end1-start1).reset_index(name ='processing_time')
    result['processing_time'] = result['processing_time'].round(3)
    return result

    
    
    

    
