select 
    d.name as Department,
    e.name as Employee,
    salary as Salary
from Employee e
left join Department d
on departmentId = d.id
where (salary,departmentId) in 
    (select max(salary) , departmentId from Employee group by departmentId)
