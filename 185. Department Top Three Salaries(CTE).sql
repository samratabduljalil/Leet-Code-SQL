# Write your MySQL query statement below
with rank_table as (select department.name as Department ,employee.name as Employee, employee.salary as salary,
dense_rank() over (partition by employee.departmentId order by employee.salary DESC) as ranks
from employee join Department on employee.departmentId = department.id )
select Department ,Employee,salary
from rank_table 
where ranks <=3
