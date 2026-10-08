-- LeetCode #570: Managers with at Least 5 Direct Reports
-- Difficulty: Medium
--
-- Problem:
-- Write a solution to find managers with at least five direct reports.
--
-- Approach: self join on id and group on managerid and having count of manager id >= 5
--
-- Pattern:
-- SELF JOIN , GROUP BY , HAVING , COUNT
--
-- Solution:
select e.name 
from employee e 
join employee m
on e.id = m.managerId 
group by m.managerId 
having count(m.managerId)>=5

---------------------
--Panda solution---
--- Approach: join on id's and left join and count values on managerid then filterout the count greater than and equal to 5 and retun only name from it
import pandas as pd

def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    df_join = employee.merge(employee['managerId'].value_counts() , left_on ='id',right_on='managerId',how='left')
    filters =(df_join['count']>=5)
    return df_join[filters][['name']]
