# Write your MySQL query statement below
with minDate as (select * ,Min(event_date) as first
from Activity
group by player_id ),
player as (select a.player_id
from minDate m
join activity a
on m.player_id =a.player_id
where a.event_date = DATE_ADD(m.first, interval 1 day))
select  round(count(distinct p.player_id)/count( distinct m.player_id),2) as fraction
from minDate m
left join player p 
on m.player_id = p.player_id