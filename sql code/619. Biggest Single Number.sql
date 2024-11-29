# Write your MySQL query statement below
with nums as (select num
from mynumbers
group by num
having count(*) =1)
select Max(num) as num
from nums