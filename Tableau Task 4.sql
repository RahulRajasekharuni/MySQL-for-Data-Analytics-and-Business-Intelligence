select * from departments;

drop procedure if exists p_avg_sal_gen_dep;

delimiter $$
create procedure  p_avg_sal_gen_dep(in p_min_sal int, in p_max_sal int)
begin
	
    select e.gender, d.dept_name, avg(s.salary) as avg_salary
	from employees e
	join salaries s on e.emp_no = s.emp_no
	join dept_emp de on e.emp_no = de.emp_no
	join departments d on de.dept_no = d.dept_no
    where s.salary between p_min_sal and p_max_sal
	group by e.gender, d.dept_name
	order by d.dept_no;
	
end$$
delimiter ;

select e.gender, avg(s.salary) as avg_salary, d.dept_name
from employees e
join salaries s on e.emp_no = s.emp_no
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
group by e.gender, d.dept_name
order by d.dept_no;

select * from departments;

call p_avg_sal_gen_dep(0,100000);