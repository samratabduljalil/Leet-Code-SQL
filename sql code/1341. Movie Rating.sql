select
(select title 
from movies m left join MovieRating r
on m.movie_id = r.movie_id
and created_at like '2020-02-%%'
group by r.movie_id
order by avg(rating) DESC, title ASC
limit 1) as results
union all
select 
(select name 
from users u left join MovieRating r
on u.user_id = r.user_id
group by r.user_id
order by count(r.rating) DESC, name ASC
limit 1) as results
