select s.user_id ,round(avg(case when c.action='confirmed' then 1 else 0 end),2) as confirmation_rate
from Signups as s
left join 
confirmations as c
on s.user_id = c.user_id
group by
s.user_id 