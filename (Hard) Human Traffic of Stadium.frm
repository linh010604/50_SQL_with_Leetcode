with cte as (
    select 
        case 
            when @people < 100 and people >= 100 then @id := id 
            when @people >= 100 and people >= 100 then @id := @id
            else @id := id
        end as id,
        @people := people as people,
        id as idd,
        visit_date
    from Stadium , (select @id := 0) as tmp , (select @people := 0) as tmp1
)
select idd as id , visit_date, people
from cte 
where id in (
    select id as check_id
    from cte
    group by id
    having count(visit_date) > 2 
)

