/* from the emp_manager table, extract the record data only of those employees who are managers as well*/

select * 
from emp_manager;

#solution 1
select distinct e1.*
from emp_manager e1
join emp_manager e2 on e1.emp_no = e2.manager_no;

#solution 2
select e1.*
from emp_manager e1
join emp_manager e2 on e1.emp_no = e2.manager_no
where e2.emp_no in(
	select manager_no
    from emp_manager);