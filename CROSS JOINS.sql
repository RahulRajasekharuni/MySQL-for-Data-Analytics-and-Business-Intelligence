#best practice code
select dm.*,d.*
from dept_manager dm
cross join departments d
order by dm.emp_no, d.dept_no;

#same as cross join
select dm.*,d.*
from dept_manager dm, departments d
order by dm.emp_no, d.dept_no;

#same as cross join
select dm.*,d.*
from dept_manager dm join departments d
order by dm.emp_no, d.dept_no;

#best practice code
select dm.*,d.*
from dept_manager dm
cross join departments d
where d.dept_no <> dm.dept_no
order by dm.emp_no, d.dept_no;

#inner join with cross join
select e.*, d.*
from departments d
cross join dept_manager dm
join employees e on dm.emp_no = e.emp_no
where d.dept_no = dm.dept_no
order by dm.emp_no, d.dept_no;