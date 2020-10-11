#ouput male or female into gender column in result set box
select emp_no, first_name, last_name,
case
	when gender ='M' then 'male'
    else 'female'
End as gender
from employees;

#ouput male or female into gender column in result set box, another syntax - this syntax does not work for is null or not null
select emp_no, first_name, last_name,
case gender
	when 'M' then 'male'
    else 'female'
End as gender
from employees;


#uses case statement and joins to show in output which employee is manager or not
select e.emp_no, e.first_name, e.last_name,
case
	when dm.emp_no is not null then 'Manager'
    else 'Employee'
end as is_manager
from employees e
left join dept_manager dm on dm.emp_no = e.emp_no
where e.emp_no > 109990;

#using if construct
select emp_no, first_name, last_name,
if( gender ='M','Male','female') as gender
from employees;

#obtain the increase of salary for all department managers based on some conditions
select dm.emp_no, e.first_name,e.last_name, max(s.salary)- min(s.salary) as salary_difference,
case
	when max(s.salary)- min(s.salary) > 30000 then 'Salary was rasied by more than 30000'
    when max(s.salary)- min(s.salary) between 20000 and 30000 then 'salary was raised by more than 20000 but less than 30000'
    else 'salary was raised by less than 20000'
end as salary_increase
from dept_manager dm
join employees e on e.emp_no = dm.emp_no
join salaries s on s.emp_no = dm.emp_no
group by s.emp_no;

/*obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990.
 Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. */

select e.emp_no, e.first_name, e.last_name,
case
	when dm.emp_no is not null then 'manager'
    else 'employee'
end as is_manager
from employees e
left join dept_manager dm on dm.emp_no = e.emp_no
where e.emp_no > 109990
order by e.emp_no;

/*Extract a dataset containing the following information about the managers: employee number, first name, and last name. Add two columns at the end – 
one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.*/

select dm.emp_no, e.first_name, e.last_name, max(s.salary) - min(s.salary) as salary_difference,
case
	when max(s.salary) - min(s.salary) > 30000 then 'High'
    else 'Low'
end as salary_raise
from dept_manager dm
join employees e on e.emp_no = dm.emp_no
join salaries s on dm.emp_no = s.emp_no
group by s.emp_no;

select dm.emp_no, e.first_name, e.last_name, max(s.salary) - min(s.salary) as salary_difference,
if (max(s.salary) - min(s.salary) > 30000, 'high', 'low') as salary_raise
from dept_manager dm
join employees e on e.emp_no = dm.emp_no
join salaries s on dm.emp_no = s.emp_no
group by s.emp_no;

/* Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column,
called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t.*/

select e.emp_no, e.first_name, e.last_name,
case
	when max(de.to_date) > sysdate() then 'employed'
    else 'unemployed'
end as employment
from employees e
join dept_emp de on e.emp_no = de.emp_no
group by de.emp_no
order by de.emp_no
limit 100;
