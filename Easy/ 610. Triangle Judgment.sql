
select 
    x , y , z ,
    case 
        when x > 0 and y > 0 and z > 0 and abs(x+y) > z and abs(z+y) > x and abs(x+z) > y then 'Yes'
        else 'No'
    end as triangle
from Triangle
