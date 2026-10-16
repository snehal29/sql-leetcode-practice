-- LeetCode #602. Friend Requests II: Who Has the Most Friends
-- Difficulty: Medium
--
-- Problem:
-- Write a solution to find the people who have the most friends and the most friends number.
-- The test cases are generated so that only one person has the most friends.
--
-- Approach: Use Union all for ids in CTE then group the id and count the id and desc order the counted id and get only one record
--
-- Pattern:
-- CTE , UNION ALL , COUNT , GROUP BY , ORDER BY , LIMIT
--
-- Solution:
with all_id as (
    select requester_id as id 
    from requestaccepted
    union all
    select accepter_id  as id
    from requestaccepted
)
select id , count(id) as num
from all_id
group by id
order by count(id) desc
limit 1

---------------------
--Panda solution--- use the concat for all id's then countvalues and get only 1 record 
import pandas as pd

def most_friends(request_accepted: pd.DataFrame) -> pd.DataFrame:
    df_all = pd.concat([request_accepted['requester_id'],request_accepted['accepter_id']])
    df = (df_all.value_counts().reset_index())
    df.columns=['id','num']
    return df.head(1)
