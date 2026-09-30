-- LeetCode #1517: Find Users With Valid E-Mails
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find the users who have valid emails.
-- A valid e-mail has a prefix name and a domain where:
-- The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
-- The domain must be exactly '@leetcode.com' in lowercase.
-- 
-- Approach: 
-- Like binary '%@leetcode.com' --> like for pattern matching and binary for the case sensitive
--  REGEXP 
-- 1.'^' - for starting of pattern
-- 2.[a-zA-Z] - for all lower and upper case letters
-- 3.[a-zA-Z0-9_.-] - for combination of lower ,upper case, 0 to 9 numbers , . and - combination
-- 4. *@leetcode.com - for end of patter with this pattern
-- 5. $ - this is end of all combination of pattern 
--
-- Pattern:
-- Like and REGEXP 
--
-- Solution:
select * from Users
where mail like binary '%@leetcode.com'  and
mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode.com$'



