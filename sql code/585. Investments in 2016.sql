select round(sum(i.tiv_2016),2) as tiv_2016
from insurance i
join(select tiv_2015
from insurance 
group by tiv_2015
having count(*)>1)
dup_tiv on i.tiv_2015 = dup_tiv.tiv_2015
where (i.lat,i.lon  ) not in (select lat,lon
from insurance 
group by lat, lon
having count(*)>1)