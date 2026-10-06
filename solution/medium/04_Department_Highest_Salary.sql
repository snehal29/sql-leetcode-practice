-- LeetCode #184: Department Highest Salary
-- Difficulty: Medium
--
-- Problem:
-- Write a solution to find employees who have the highest salary in each of the departments.
-- Return the result table in any order.
--
-- Approach: Do join on departmentId and use subquery where it compare the max salary with same employee table 
--
-- Pattern:
-- Inner join , Subquery , max()
--
-- Solution:
Select d.name as Department , e.name as Employee , e.Salary as Salary
from Employee e 
join Department d 
on e.departmentId = d.id
where e.salary = (select max(e2.salary) from Employee e2
where e2.departmentId = e.departmentId)

---------------------
--Panda solution---
--- Approach:  do merge/join on both df and find high salary using loc and group by and rename all required column name
import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    df_join = pd.merge(employee , department , left_on ='departmentId',right_on='id',how='inner')
    high_salary = df_join.loc[df_join.groupby('departmentId')['salary'].transform('max')==df_join['salary']]
    result = high_salary[['name_x','salary','name_y']].rename(columns={'name_y':'Department','name_x':'Employee','salary':'Salary'})
