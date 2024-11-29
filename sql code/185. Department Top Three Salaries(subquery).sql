# Write your MySQL query statement below
 select Department ,Employee,salary
from (select department.name as Department ,employee.name as Employee, employee.salary as salary,
dense_rank() over (partition by employee.departmentId order by employee.salary DESC) as ranks
from employee join Department on employee.departmentId = department.id ) as rank_table
where rank_table.ranks <=3
