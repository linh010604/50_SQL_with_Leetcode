with cte as (
    select 
        if(@visited_on = visited_on , @_amount := @_amount + amount , @_amount := amount)
        as amount ,
        @visited_on := visited_on as visited_on
    from  
        Customer ,
        (select @visited_on := date("0-0-0")) as tmp1, 
        (select @amount := 0) as tmp2
) ,
cte2 as (
    select 
    @id := @id + 1 as id , 
    max(amount) as amount, visited_on
    from cte ,
        (select @id := 0) as tmp
    group by visited_on
) ,
cte3 as (
    select
        id ,
        sum(amount) over (order by id range between 6 preceding and current row) as sum ,
        amount,
        visited_on
    from cte2
) 
select 
    visited_on , 
    sum as amount , 
    round(sum/7,2) as average_amount 
from cte3 where id >= 7
