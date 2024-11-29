# Write your MySQL query statement below
with ranked as (
    select 
(case when order_date = customer_pref_delivery_date then "immediate" else "scheduled" end )as delivery_type,
rank() over (partition by customer_id order by order_date asc  )as ranks
from delivery)
select round(avg(case when delivery_type ="immediate" then 100 else 0 end),2) as immediate_percentage
from ranked
where ranks = 1

