# Write your MySQL query statement below
with total as (select visited_on , sum(amount)as amount from Customer group by visited_on ),
nday as(select visited_on ,
sum(amount) over (order by visited_on rows between 6 preceding and current row) as amount
, round(avg(amount) over (order by visited_on rows between 6 preceding and current row),2) as average_amount,
row_number()over(order by visited_on ) as row_num
from total)
SELECT visited_on, amount, average_amount
from nday
where row_num >=7
order by visited_on asc