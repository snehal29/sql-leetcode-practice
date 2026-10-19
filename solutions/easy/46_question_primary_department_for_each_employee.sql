-- LeetCode #1789. Primary Department for Each Employee
--
-- Problem:Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department.
-- Note that when an employee belongs to only one department, their primary column is 'N'.
-- Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.
--
-- Approach: UNION for combining two select with all values
--  1. Selecting the emp id and department id where primay flag is Y 
--  2. Selecting the emp id and department id , grouping employee id and employee id count muct be 1
-- Pattern:
-- UNION , WHERE , GROUP BY , HAVING , COUNT
--
-- Solution:
Select employee_id , department_id 
from Employee where primary_flag = 'Y'
union 
select employee_id , department_id 
from employee group by employee_id 
having count(employee_id) =1

 

--Solution in pandas-- 
-- grouping the emp id and count is 1 then getting primary flag where Y and concating the both filters and droping duplicate values
import pandas as pd

def find_primary_department(employee: pd.DataFrame) -> pd.DataFrame:
    df_gp = employee[employee.groupby('employee_id')['department_id'].transform('count') == 1]
    df = employee[employee['primary_flag']=='Y'] 
    df_result = pd.concat([df_gp,df]).drop_duplicates()
    return df_result[['employee_id','department_id']]
    
