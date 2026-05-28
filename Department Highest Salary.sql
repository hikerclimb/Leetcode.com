select d.name as Department, e.name as Employee, salary
 from Employee e join Department d 
 on d.id = departmentId where (departmentId,salary) 
 IN (select departmentId, max(salary) from Employee group by departmentId)