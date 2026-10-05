-- LeetCode #1693: Daily Leads and Partners
-- Difficulty: Easy
--
-- Problem: For each date_id and make_name, find the number of distinct lead_id's and distinct partner_id's. 
--
--
-- Approach: 
-- Apply Group by on date_id and made_name and distinct count of leads and partners
--
-- Pattern:
-- Group by , distinct , count
--
-- Solution:
select date_id , make_name , count(distinct lead_id) as unique_leads, count(distinct partner_id) as unique_partners from DailySales
group by date_id , make_name
 

--Solution in pandas--
import pandas as pd

def daily_leads_and_partners(daily_sales: pd.DataFrame) -> pd.DataFrame:
    df = daily_sales.groupby(['date_id','make_name']).agg({'lead_id':'nunique','partner_id':'nunique'}).reset_index()
    df.columns = ['date_id','make_name','unique_leads','unique_partners']
    return df  

    
    
    

    
