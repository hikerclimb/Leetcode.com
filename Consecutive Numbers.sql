with cte as (
    select num,
    lead(num, 1) OVER() num1, lead(num, 2) OVER() num2
from Logs )

select distinct num ConsecutiveNums from cte where (num = num1) and (num=num2)