select product_id,'store1' as store , store1 as price
from Products
where not store1 is null
union  (
    select product_id ,'store2', store2
    from Products
    where not store2 is null
)
union  (
    select product_id,'store3' , store3
    from Products
    where not store3 is null
)
