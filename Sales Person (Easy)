select name 
from salesperson
where not sales_id in 
    ( select o.sales_id 
        from orders o 
        left join company c 
        on c.com_id = o.com_id 
        where c.name = 'RED'
    )
