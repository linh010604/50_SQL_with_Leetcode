with cte as(
    select id ,client_id ,driver_id , city_id , status , request_at
    from Trips t
    left join Users u on u.users_id = client_id
    where banned = "No"
)
,cte1 as(
    select id ,client_id ,driver_id , city_id , status , request_at
    from cte
    left join Users u on u.users_id = driver_id
    where banned = "No"
)
select request_at as Day,
    round(avg(case
        when status like "cancelled%"  then 1
        else 0
    end) , 2) as "Cancellation Rate" 
from cte1
where request_at between  "2013-10-01" and "2013-10-03"
group by request_at
