select * 
from dept_manager;

#sub query example
select * 
from employees e
where e.emp_no in (
select dm.emp_no
from dept_manager dm);

#just show all records from employees table and inner join with dept_manager table to show records that match in both tables
select e.* from employees e
join dept_manager dm on e.emp_no = dm.emp_no;

/* Sub-query used to show employees in the employees table AND in the dept_manager table */
select * 
from employees e
where e.emp_no in (
select dm.emp_no
from dept_manager dm);

#select all managers hired betweem 1990 and 95
select * 
from employees e
where e.emp_no in (
	select dm.emp_no
	from dept_manager dm)
and e.hire_date between '1990-01-01' and '1995-01-01';

SELECT *
FROM dept_manager
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');
 
 /* Sub-query used to show employees in the employees table AND in the dept_manager table using exists function */
select * 
from employees e
where exists (
	select *
	from dept_manager dm
    where dm.emp_no = e.emp_no);

# Select the entire information for all employees whose job title is “Assistant Engineer”.     
select * 
from employees e
where exists(
	select *
	from titles t
    where t.title = 'Assistant Engineer'  and e.emp_no = t.emp_no);
    
/# assign employee number 110022 as a manger to all employees from 10001 to 10020, and employee number 110039 as a manager to all employees from 10021 to 10040#/
Select A.*
from
	(select e.emp_no as employee_ID, min(de.dept_no) as department_code, #min department code is selected to ensure only one departmnt number is shown in output
		(select emp_no
		from dept_manager
		where emp_no = 110022) as manager_ID
	From employees e
	join dept_emp de on e.emp_no = de.emp_no
	where e.emp_no <= 10020
	group by e.emp_no
	order by e.emp_no) as A
union Select B.*
from
	(select e.emp_no as employee_ID, min(de.dept_no) as department_code, #min department code is selected to ensure only one departmnt number is shown in output
		(select emp_no
		from dept_manager
		where emp_no = 110039) as manager_ID
	From employees e
	join dept_emp de on e.emp_no = de.emp_no
	where e.emp_no between 10021 and 10040
	group by e.emp_no
	order by e.emp_no) as B