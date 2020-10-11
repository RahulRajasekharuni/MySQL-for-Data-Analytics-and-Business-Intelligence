create index i_hire_date on employees(hire_date);
create index i_composite on employees(first_name,last_name);

#how to drop indexes
alter table employees
drop index i_hire_date;

select * 
from salaries
where salary > 89000;

create index i_salary on salaries(salary);