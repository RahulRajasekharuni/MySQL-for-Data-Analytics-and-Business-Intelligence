use employees;

#1
select avg(s.salary) as average_salary, e.gender, de.dept_no, d.dept_name
from salaries s
join employees e on s.emp_no = e.emp_no
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
group by e.gender, de.dept_no
order by de.dept_no;

#2
select min(dept_no)
from dept_emp;
select max(dept_no)
from dept_emp;

use employees;

#3
select e.emp_no, (select min(dept_no) from dept_emp de where e.emp_no = de.emp_no) as dept_no, 
case
	when e.emp_no <= 10020 then 110022
    else 110039
end as manager
from employees e
where e.emp_no <= 10040;

# exercise 3 using a join instead of a sub-query
select e.emp_no, min(de.dept_no) as dept_no,
case
	when e.emp_no <= 10020 then 110022
    else 110039
end as manager
from employees e
join dept_emp de on e.emp_no = de.emp_no
where e.emp_no <= 10040
group by e.emp_no;


#4
select * 
from employees
where year(hire_date) = '2000';

#5
select * 
from titles
where title = 'Engineer';

select * 
from titles
where title like '%Engineer%';

#6
DROP procedure IF EXISTS last_dept;

DELIMITER $$
CREATE PROCEDURE last_dept (in p_emp_no integer)
BEGIN
SELECT e.emp_no, d.dept_no, d.dept_name
FROM employees e
        JOIN dept_emp de ON e.emp_no = de.emp_no
        JOIN departments d ON de.dept_no = d.dept_no
WHERE e.emp_no = p_emp_no
        AND de.from_date = (SELECT MAX(from_date)
        FROM dept_emp
        WHERE emp_no = p_emp_no);
END$$
DELIMITER ;

call employees.last_dept(10010);

#7
select * from salaries;

select count(*) 
from salaries
where salary >=100000 and year(to_date) - year(from_date) > 1;

#use datediff sys function
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000
        AND DATEDIFF(to_date, from_date) > 365;
        
#8
drop trigger if exists t_hire_date
delimiter $$
create trigger t_hire_date
before insert on employees
for each row
begin
declare today DATETIME;
 SELECT date_format(sysdate(), '%Y-%m-%d') INTO today;
	if new.hire_date > today then
		set new.hire_date = today;
    end if;
end$$
delimiter ;

#9
drop function if exists f_largest_contract_salary
delimiter $$
create function f_largest_contract_salary(p_emp_no int) returns decimal(10,2)
deterministic
begin
	declare v_lsal decimal(10,2);
	select max(s.salary) into v_lsal
	from salaries s
    where s.emp_no = p_emp_no;
    return v_lsal;
end$$
delimiter ;

select f_largest_contract_salary(11356);

#10
drop function if exists f_contract_salary
delimiter $$
create function f_contract_salary(v_emp_no int, v_rule char(3)) returns decimal(10,2)
deterministic
begin
	declare v_lsal decimal(10,2);
	select case
		when v_rule = 'min' then min(s.salary)
        when v_rule = 'max' then max(s.salary)
        else  MAX(s.salary) - MIN(s.salary)
	end as contract_salary into v_lsal
	from salaries s
    where s.emp_no = v_emp_no;
    return v_lsal;
end$$
delimiter ;

select f_contract_salary(11356,'max');

select e.emp_no, f_contract_salary(e.emp_no, 'max') as max_sal
from employees e
where e.emp_no = 11356;
        

