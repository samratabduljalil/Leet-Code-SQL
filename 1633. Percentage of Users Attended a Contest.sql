# Write your MySQL query statement below
select R.contest_id,round((count(R.user_id)*100/(select count(*) from users)),2) as percentage
from users as u right join register as R
on u.user_id = R.user_id
group by R.contest_id
order by  percentage desc,
R.contest_id asc