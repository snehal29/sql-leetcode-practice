-- LeetCode #596: classes with at least 5 students
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find all the classes that have at least five students.
--
-- Approach:
-- group by and having , count
-- 
-- Pattern:
-- group by , having , count ()
--
-- Solution:
select class from Courses
group by class
having count(*) >=5
