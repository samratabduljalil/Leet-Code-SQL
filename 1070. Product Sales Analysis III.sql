SELECT s.product_id, 
       s.year AS first_year, 
      s.quantity, 
       s.price
FROM sales s
join (select product_id, min(year) as year from sales group by product_id) as Y
on s.product_id=Y.product_id
and s.year=Y.year
