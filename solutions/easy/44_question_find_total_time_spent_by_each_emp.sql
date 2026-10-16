-- LeetCode #1741. Find Total Time Spent by Each Employee
--
-- Problem: Write a solution to calculate the total time in minutes spent by each employee on each day at the office. Note that within one day,
-- an employee can enter and leave more than once. The time spent in the office for a single entry is out_time - in_time..
--
-- Approach: 
--  Group by the each emp and event_day for having details of each day , then sum the out time minus in time 
-- Pattern:
-- Group by , SUM , Where
--
-- Solution:
Select event_day as day , emp_id , sum(out_time - in_time) as total_time
from Employees
where in_time < out_time
group by emp_id , event_day

 

--Solution in pandas--
import pandas as pd

def total_time(employees: pd.DataFrame) -> pd.DataFrame:
    employees['total_time']=employees['out_time'] - employees['in_time']
    df_gp =employees.groupby(['emp_id','event_day'])['total_time'].sum().reset_index().rename(columns={'event_day':'day'})
    return df_gp[['day','emp_id','total_time']]
    

    
    
    

    
