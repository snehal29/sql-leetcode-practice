-- LeetCode #182: Duplicate Emails
-- Difficulty: Easy
--
-- Problem:
-- Return duplicate mail ids.
--
-- Approach:
-- Use group by for grouping similar number of emails and having to use agg. function count greater than 1 means duplicate
--
-- Pattern:
-- GROUP BY 
-- HAVING , COUNT
--
-- Solution:
select email as Email 
from Person
group by email
having count(*)>1 
