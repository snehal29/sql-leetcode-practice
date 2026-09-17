-- LeetCode #1141: User activity for past 30 days
-- Difficulty: Easy
--
-- Problem:
-- Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.
-- 
-- Note: Any activity from ('open_session', 'end_session', 'scroll_down', 'send_message') will be considered valid activity for a user to be considered active on a day.

-- Approach:
-- Between for dates , group by on the activity date and count()  
-- another way is to DATE_SUB and INTERVAL 30 DAY 
-- another way is to Date difference greater and less than 0 and 30 
--
-- Pattern:
-- GROUP BY , COUNT() , DATE_SUB  
--
-- Solution:
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity 
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date
--HAVING activity_date >= DATE_SUB('2019-07-27', INTERVAL 29 DAY)
--WHERE DATEDIFF('2019-07-27', activity_date) < 30 AND DATEDIFF('2019-07-27', activity_date)>=0
--OPTIONAL CONDITIONS ALSO WORK 
