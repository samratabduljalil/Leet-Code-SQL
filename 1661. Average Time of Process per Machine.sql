select 
A1.machine_id,
Round(Avg(A2.timestamp-A1.timestamp),3) as processing_time
from
Activity as A1
join 
Activity as A2
ON
A1.machine_id=A2.machine_id
and A1.process_id =A2.process_id
and A1.activity_type = 'start'
and A2.activity_type= 'end'
group by 
A1.machine_id
