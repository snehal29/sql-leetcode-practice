-- LeetCode #585: Investments in 2016
-- Difficulty: Medium
--
-- Problem:
--Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
--   have the same tiv_2015 value as one or more other policyholders, and
--   are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
--   Round tiv_2016 to two decimal places.
--
-- Approach: Use two sunqueries for each condition and use that in were condition on AND in  each condition do group by and having count and in select SUM on 2016 data
--
-- Pattern:
-- SUM() , WHERE , SUBQUERY , GROUP BY ,HAVING , CONCAT , COUNT , ROUND()
--
-- Solution:
select round(sum(tiv_2016),2) as tiv_2016
from Insurance
where tiv_2015 IN (select tiv_2015 from insurance group by tiv_2015 having count(*)>1 )  
and concat(lat,lon) IN (select  concat(lat,lon) from insurance group by lat , lon having count(*)=1 )5

---------------------
--Panda solution---
import pandas as pd

def find_investments(insurance: pd.DataFrame) -> pd.DataFrame:
    insurance['tiv_cnt'] = insurance.groupby('tiv_2015')['tiv_2015'].transform('count')
    insurance['loc_cnt'] = insurance.groupby(['lat','lon'])['pid'].transform('count')
    filters=(insurance[(insurance['tiv_cnt']>1) &(insurance['loc_cnt']==1)]['tiv_2016'].sum())
    return pd.DataFrame({'tiv_2016':[round(filters,2)]})
