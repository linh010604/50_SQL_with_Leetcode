with cte as 
    (select * from Employee group by salary order by salary desc )
, cte1 as (
    select 
    @id := @id + 1 as id,
    if(@id = 2 , salary , null) as salary
    from cte , (select @id := 0) as tmp
    order by salary desc
    limit 1
)
select salary as SecondHighestSalary from cte1 
