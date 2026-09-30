-- LeetCode #1527: Patients With a Condition
-- Difficulty: Easy
--
-- Problem: Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.
-- 
--
-- Approach:
--  Using like with for starting % and using little space 
-- 
-- Pattern:
--  Like 'DIAB1%' and '% DIAB1%'
--
-- Solution:
Select *
from Patients
where conditions like 'DIAB1%' or conditions like '% DIAB1%'

--Solution in pandas--
import pandas as pd

def find_patients(patients: pd.DataFrame) -> pd.DataFrame:
    df = patients[(patients.conditions.str.contains(r'(^DIAB1)|( DIAB1)'))]
    return df
    
