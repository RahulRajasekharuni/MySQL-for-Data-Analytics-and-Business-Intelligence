select e.first_name, e.last_name, e.hire_date, dm.from_date, d.dept_name
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no
order by e.emp_no;

select d.dept_name, avg(salary) as 'average salary'
from departments d
join dept_manager m on d.dept_no = m.dept_no
join salaries s on m.emp_no = s.emp_no
group by d.dept_name
having avg(salary) > 60000
order by avg(salary) desc;  

#select what you want to group it by and then count the individuals, inner join the tables
 select e.gender, count(d.emp_no)
 from employees e
 join dept_manager d on e.emp_no = d.emp_no
 group by gender;
 