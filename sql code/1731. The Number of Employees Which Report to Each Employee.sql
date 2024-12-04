# Write your MySQL query statement below
with report as (select employee_id ,name ,reports_to ,age
from employees
where reports_to is not null)
select e.employee_id,e.name,count(r.reports_to) as reports_count,round(avg(r.age)) as average_age
from employees e join report r
on e.employee_id = r.reports_to
group by r.reports_to
order by e.employee_id

