-- LeetCode #1227: Students and examinations
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find the number of times each student attended each exam.
-- Return the result table ordered by student_id and subject_name.
-- The result format is in the following example.
--
-- Approach:
-- Cross join with subject and left join with examination , group by and order by 
--
-- Pattern:
-- cross and left join , group by , order by
--
-- Solution:
select s.student_id ,
     s.student_name ,
     b.subject_name , 
     count(e.subject_name) as attended_exams
from 
    Students s
cross join 
    Subjects b 
Left join   
    Examinations e  
    on s.student_id = e.student_id
    and  b.subject_name = e.subject_name
group by
     s.student_id ,
     s.student_name,
     b.subject_name 
order by
     s.student_id , 
      b.subject_name
