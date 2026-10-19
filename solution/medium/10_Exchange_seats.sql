-- LeetCode #626. Exchange Seats 
-- Difficulty: Medium
--
-- Problem:
-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
-- Return the result table ordered by id in ascending order.
--
-- Approach: Used CASE WHEN for id's with % for even and odd id's and then ordered them asc
--
-- Pattern:
-- CASE WHEN , % , + , - , Order by
--
-- Solution:
Select case
    when id%2=1 and id+1 in (select id from seat) then id+1
    when id%2=0 then id-1
    else id
end as id , student
from seat
order by id

---------------------
--Panda solution--- 
-- approach : convert id's to list 1 to 5 , then for loop start from 1 and end 5 and steps 2 (i.e: 1, 3). then swap the ids id-1 and id and assign to id and sort them
import pandas as pd

def exchange_seats(seat: pd.DataFrame) -> pd.DataFrame:
    id = list(range(1, len(seat)+1))
    for i in range(1,len(id),2):
        id[i-1],id[i] = id[i],id[i-1]
    seat['id']=id
    return seat.sort_values('id')
