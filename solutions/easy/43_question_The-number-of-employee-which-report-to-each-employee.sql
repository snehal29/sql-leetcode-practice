-- LeetCode #1731. The Number of Employees Which Report to Each Employee
-- Difficulty: Easy
--
-- Problem: Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
-- Return the result table ordered by employee_id.
--
-- Approach: 
-- self join the employee table for emp and manager on employeed_id and reports_to and group by emp id and name and order them in emp_id ascending
-- count() for no. of emp and rounded avg for evg age 
-- Pattern:
-- Group by , order by , slef join , round , avg , count
--
-- Solution:
Select e1.employee_id , e1.name , count(e.employee_id) as reports_count , 
round(avg(e.age)) as average_age
from Employees e
join Employees e1
on e.reports_to = e1.employee_id
group by e1.employee_id 
order by e1.employee_id
 

--Solution in pandas--
import pandas as pd

def count_employees(employees: pd.DataFrame) -> pd.DataFrame:
    df_join = employees.merge(employees , left_on ='reports_to',right_on ='employee_id',how='inner') 
    df_grp = df_join.groupby(['employee_id_y','name_y']).agg(reports_count =('employee_id_x','count'),average_age=('age_x','mean')).reset_index()
    df_grp['average_age'] = df_grp['average_age'].add(1e-10).round()
    return (df_grp.rename(columns={'employee_id_y':'employee_id','name_y':'name'}).sort_values('employee_id'))
    

    
    
    

    
