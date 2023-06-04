with cte as (
  select employee_id from Employees
  union all
  select employee_id from Salaries
)
select employee_id from cte group by employee_id having count(employee_id) = 1 order by employee_id
