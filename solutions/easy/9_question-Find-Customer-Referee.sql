-- LeetCode #584:Find Customer Referee
-- Difficulty: Easy
--
-- Problem:
--  Find the names of the customer that are either:
--  referred by any customer with id != 2.
--  not referred by any customer.
--
-- Approach:
-- Use where IS NULL , OR 
--
-- Pattern:
-- where clause
--
--
-- Solution:
select name from Customer 
where referee_id is null
or referee_id != 2
