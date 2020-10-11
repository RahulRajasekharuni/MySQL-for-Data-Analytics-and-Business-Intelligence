drop procedure if exists select_employees
DELIMITER $$
create procedure select_employees()
begin
	select * from employees
    limit 1000;
end$$
DELIMITER ;

call select_employees();

drop procedure if exists select_avg_salary
DELIMITER $$
create procedure select_avg_salary()
begin
	select avg(salary) as average_salary
    from salaries;
end$$
DELIMITER ;

call select_avg_salary();

DROP PROCEDURE select_employees;

call emp_salary(10039);

#stored procedure with input
DELIMITER $$
create procedure emp_avg_salary(in p_emp_no int)
begin
	select e.first_name, e.last_name, avg(s.salary) as average_salary
    from employees e
    join salaries s on e.emp_no = s.emp_no
    where e.emp_no = P_emp_no;
end$$
DELIMITER ;

call emp_avg_salary(10039);

#stored procedure with input and output
DELIMITER $$
create procedure emp_avg_salary_out(in p_emp_no int, out p_avg_salary decimal(10,2))
begin
	select avg(s.salary) into p_avg_salary
    from employees e
    join salaries s on e.emp_no = s.emp_no
    where e.emp_no = p_emp_no;
end$$
DELIMITER ;

drop procedure if exists emp_info
DELIMITER $$
create procedure emp_info(in p_emp_first_name varchar(40), in p_emp_last_name varchar(40), out p_emp_no integer)
begin
	select distinct e.emp_no into p_emp_no
    from employees e
    where e.first_name =  p_emp_first_name and e.last_name =  p_emp_last_name;
end$$
DELIMITER ;

call emp_info('gal','denis' ,@p_emp_no);
select @p_emp_no;