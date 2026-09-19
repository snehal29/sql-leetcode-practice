-- LeetCode #1179: Reformat Department Table
-- Difficulty: Easy
--
-- Problem:
-- Reformat the table such that there is a department id column and a revenue column for each month.
-- The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
-- 
--
-- Approach:
-- Use If condition and result also else part and sum that revenue value for each month 
--
-- Pattern:
-- SUM , IF , Group by and order by
--
-- Solution:
select id ,
    sum(if(month='Jan',revenue, null)) as Jan_Revenue,
    sum(if(month='Feb',revenue, null)) as Feb_Revenue,
    sum(if(month='Mar',revenue, null)) as Mar_Revenue,
    sum(if(month='Apr',revenue, null)) as Apr_Revenue,
    sum(if(month='May',revenue, null)) as May_Revenue,
    sum(if(month='Jun',revenue, null)) as Jun_Revenue,
    sum(if(month='Jul',revenue, null)) as Jul_Revenue,
    sum(if(month='Aug',revenue, null)) as Aug_Revenue,
    sum(if(month='Sep',revenue, null)) as Sep_Revenue,
    sum(if(month='Oct',revenue, null)) as Oct_Revenue,
    sum(if(month='Nov',revenue, null)) as Nov_Revenue,
    sum(if(month='Dec',revenue, null)) as Dec_Revenue
from Department
group by id 
order by id 
