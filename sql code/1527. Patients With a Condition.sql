# Write your MySQL query statement below
select Patient_id , patient_name ,conditions
from patients
where conditions REGEXP  '(^|\\s+)DIAB1'