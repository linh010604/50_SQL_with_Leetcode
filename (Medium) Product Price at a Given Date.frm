with
   cte as (
       select product_id , new_price
       from Products
       where (product_id , change_date) in (select product_id, max(change_date) from products where change_date <= date("2019-08-16") group by product_id
       )) 
select 
  p.product_id ,
  ifnull(cte.new_price,10) as price
from (select distinct product_id from products) p
left join cte
on cte.product_id = p.product_id
