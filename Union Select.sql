create table e_dup(emp_no int(11),birth_date date, fn varchar (14), ln varchar(16), gender enum('M','F'), hire_date date);
insert into e_dup
select * from employees limit 20;

select * from e_dup;

insert into e_dup values('10001','1953-09-02', 'georgi','facello','m','1986-06-26');

#union requires same columns selected from both tables therefore non-existant columns from the other table is selected as null
select e.emp_no, e.fn, e.ln, null as dept_no, null as from_date
from e_dup e
union select null as emp_no, null as fn, null as ln, m. dept_no, m.from_date
from dept_manager m;

SELECT * 
FROM( SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date
FROM employees e
WHERE last_name = 'Denis'
UNION SELECT NULL AS emp_no, NULL AS first_name, NULL AS last_name, dm.dept_no, dm.from_date 
FROM dept_manager dm) as a
ORDER BY -a.emp_no DESC;