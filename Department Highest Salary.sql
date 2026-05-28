select d.name as Department, e.name as Employee, 
salary as Salary from Employee e join Department d 
on d.id = departmentId where salary IN (select max(salary) 
from Employee group by departmentId, e.name)