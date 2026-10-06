-- LeetCode #184: Department Highest Salary
-- Difficulty: Medium
--
-- Problem:
-- Write a solution to find employees who have the highest salary in each of the departments.
-- Return the result table in any order.
--
-- Approach:
-- 
-- 
--
-- Pattern:
-- Dense_rank()
--
-- Solution:
SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) as 'rank'
FROM scores;

---------------------
--Panda solution---
--- Approach: rank dense_rank , sort ascending= False and drop the id column which is not required in output
import pandas as pd

def order_scores(scores: pd.DataFrame) -> pd.DataFrame:
    scores['rank']= scores['score'].rank(method='dense', ascending=False)
    df = scores.drop('id',axis=1).sort_values(by='score',ascending=False)
    return df
