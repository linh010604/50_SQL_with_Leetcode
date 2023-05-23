with 
  cte as 
    (select customer_number , count(order_number) as count_order
    from Orders 
    group by customer_number
    order by count_order desc
    limit 1)
select customer_number
from cte
