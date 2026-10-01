-- LeetCode #1661: Average Time of Process per Machine
-- Difficulty: Easy
--
-- Problem: There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.
-- The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
-- The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
--
-- Approach: 
--  Group based on machine_id and avg end time - avg start time of process
--
--
-- Pattern:
-- Group by , AVG , Round
--
-- Solution:
select machine_id ,
round(avg(case when activity_type ='end' then  timestamp end) - avg(case when activity_type ='start' then timestamp end),3)
 as processing_time 
from Activity 
group by machine_id 
 

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

    
    
    

    
