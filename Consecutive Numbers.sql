select
if((num = lead(num, 1,NULL) OVER()) and (num = lag(num,1, NULL) OVER()),num, NULL)  
as ConsecutiveNums from Logs limit 1,1
