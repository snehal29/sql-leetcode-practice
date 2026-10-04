-- LeetCode #1683: Invalid Tweets
-- Difficulty: Easy
--
-- Problem: Write a solution to find the IDs of the invalid tweets. 
-- The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
--
--
-- Approach: 
-- Where condition and check char length of content greater than 15 
--
-- Pattern:
-- Char_length in where clause
--
-- Solution:
Select tweet_id
from Tweets
where char_length(content) > 15 
 

--Solution in pandas--
import pandas as pd

def invalid_tweets(tweets: pd.DataFrame) -> pd.DataFrame:
    df = tweets[tweets['content'].str.len()>15]
    return df[['tweet_id']]
    

    
    
    

    
