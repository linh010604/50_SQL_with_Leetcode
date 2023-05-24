select pre as ConsecutiveNums
from (select
        if (@pre = num , @cnt := @cnt + 1 , @cnt := 1) as cnt ,
        @pre := num as pre
      from Logs , (select @pre := 0) as tmp1, (select @cnt := 1) as tmp2
      ) as t
where cnt >= 3
group by pre
