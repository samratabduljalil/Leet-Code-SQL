with s as (select max(salary) as m
from Employee)

select max(salary) as SecondHighestSalary
from  s cross join Employee
where salary < s.m
