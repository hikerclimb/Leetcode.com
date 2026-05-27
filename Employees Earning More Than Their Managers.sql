select eh.name as Employee from Employee eh join 
Employee e where eh.salary > e.salary and 
eh.managerId = e.id