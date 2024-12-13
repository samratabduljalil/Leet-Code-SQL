# Write your MySQL query statement below

select p.product_name, sum(unit) as unit
from products p  left join orders o on p.product_id = o.product_id
where order_date like '2020-02-%%'
group by o.product_id
having sum(unit) >=100