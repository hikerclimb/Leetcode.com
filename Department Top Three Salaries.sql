with c as (select e.id as id, DENSE_RANK() OVER(partition by departmentId order by salary desc) as 'ranked' from Employee e )
select distinct d.name as Department, e.name as Employee, salary as Salary from Employee e join 
Department d on e.departmentId = d.id join c on e.id = c.id where c.ranked <= 3