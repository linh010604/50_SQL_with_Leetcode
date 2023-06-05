with cte as (
    select * from Employee
    order by departmentId , salary desc
),
cte1 as (
    select 
    name,
    case
        when @salary = salary and @departmentId = departmentId then @id := @id 
        when @departmentId != departmentId then @id := 1
        else @id := @id + 1
    end as id ,
    @salary := salary as salary,
    @departmentId := departmentId as departmentId
    from cte , (select @id := 0) as tmp , (select @salary := 0) as tmp1 , (select @departmentId := 0) as tmp2
)
select d.name as Department , cte1.name as Employee , salary
from cte1
left join department d on d.id = cte1.departmentId
where cte1.id  < 4
