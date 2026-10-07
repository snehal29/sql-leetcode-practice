-- LeetCode #550: Game Play Analysis IV
-- Difficulty: Medium
--
-- Problem:
-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words,
---you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.
--
-- Approach: 1st find the 1st login and then next login days in cte's and then check for the fraction from the player count and rounded that in 2 digit
--
-- Pattern:
-- CTE , MIN , join , date_add , round , count , distinct , subquery 
--
-- Solution:
with first_login as (
    select player_id , min(event_date) as first_date from Activity 
    group by player_id
 ),
 next_played_date as(
    select distinct f.player_id
    from first_login f
    join Activity a
    on f.player_id = a.player_id and
   a.event_date=date_add(f.first_date ,interval 1 day)
 )
 
 Select round(count(*)* 1.0/(select count(distinct player_id) from Activity),2) as fraction
 from next_played_date

---------------------
--Panda solution---
--- Approach: groupby for player_id on event_date and find min means 1st login then do compare event_datto 1st login and add one day in iy and groupby that on player_id find mean
--- and find fraction rounded by 2
import pandas as pd

def gameplay_analysis(activity: pd.DataFrame) -> pd.DataFrame:
    activity['first_login']=activity.groupby('player_id')['event_date'].transform('min')
    fraction =((activity['event_date']==activity['first_login']+pd.Timedelta(days=1)).groupby(activity['player_id']).any().mean())
    return pd.DataFrame({'fraction':[round(fraction,2)]})
