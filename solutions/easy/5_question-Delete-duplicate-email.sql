-- LeetCode #196: Delete Duplicate Emails
-- Difficulty: Easy
--
-- Problem:
-- delete all duplicate emails, keeping only one unique email with the smallest id 
--
-- Approach:
-- Use ROW_NUMBER() function where partition based on email and order by id asce, which will give us unique number for each email
-- Use Delete statement and SELF JOIN 
-- Pattern:
-- Delete , Self Join 
-- Window function ROW_NUMBER() 
--
-- Solution:
Delete P from Person P 
join 
(
select id,
ROW_NUMBER() over(partition by email order by id) rnk
from Person 
)t 
on P.id =t.id
where t.rnk >1;
