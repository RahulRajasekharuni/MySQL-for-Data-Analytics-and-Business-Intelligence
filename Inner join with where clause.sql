select employees.emp_no, employees.first_name, employees.last_name, salaries.salary
from employees
join salaries on employees.emp_no = salaries.emp_no
where salaries.salary > 145000;

select employees.emp_no, employees.first_name, employees.last_name, employees.hire_date, titles. title
from employees
join titles on employees.emp_no = titles.emp_no
where employees.first_name = 'Margareta' and employees.last_name = 'Markovitch';