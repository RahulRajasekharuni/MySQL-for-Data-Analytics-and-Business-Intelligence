/*Compare the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department.*/

select e.emp_no, e.gender, s.salary, s.from_date,s.to_date, de.dept_no, d.dept_name
from employees e
join salaries s on e.emp_no = s.emp_no
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where year(s.to_date) <= '2002';

select e.emp_no, e.gender, f_emp_avg_salary(e.emp_no) as average_salary, s.from_date,s.to_date, de.dept_no, d.dept_name
from employees e
join salaries s on e.emp_no = s.emp_no
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where year(s.to_date) <= '2002';

#tableau task 3 actual answer
select e.gender, round(s.salary,2) as salary, year(s.from_date) as calendar_year, d.dept_name
from employees e
join salaries s on e.emp_no = s.emp_no
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
group by d.dept_no, e.gender, calendar_year
having calendar_year <= 2002;