select name 
from Customer
where (ifnull(referee_id,0)) != 2
