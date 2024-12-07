# Write your MySQL query statement below

with productPrice as (select product_id , new_price , change_date
from Products
where change_date <= '2019-08-16'),

latestDate as (select product_id , max(change_date) as change_date
from productPrice 
group by product_id 
)

select p.product_id , 
coalesce(pp.new_price , 10) as price
from (select distinct product_id  from products) as p 
left join latestDate ld
on p.product_id = ld.product_id
left join productPrice as pp 
on pp.product_id =ld.product_id
and pp.change_date = ld.change_date