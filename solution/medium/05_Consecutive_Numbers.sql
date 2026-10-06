-- LeetCode #180: Consecutive Numbers
-- Difficulty: Medium
--
-- Problem:
-- Find all numbers that appear at least three times consecutively.
--
-- Approach: using cte and lead() window function for the next and prev num and then where matching num with prev and next number 
--
-- Pattern:
-- CTE , lead() , where
--
-- Solution:
with cet as(
  select num ,
  lead(num ,1) over() as num1,
  lead(num , 2) over() as num2
  from Logs
)
select distinct num as ConsecutiveNums from cte
where (num = num1) and (num= num2)

---------------------
--Panda solution---
--- Approach:  Use shift() to get prev an dnext num and compare num with prev an dnext with it and rename column also drop duplicates numbers
import pandas as pd

def consecutive_numbers(logs: pd.DataFrame) -> pd.DataFrame:
    logs['prev'] = logs['num'].shift(1)
    logs['next'] = logs['num'].shift(-1)
    result = logs[(logs['prev']==logs['num']) & (logs['next']==logs['num'])][['num']].drop_duplicates().rename(columns={'num':'ConsecutiveNums'})
    return result
