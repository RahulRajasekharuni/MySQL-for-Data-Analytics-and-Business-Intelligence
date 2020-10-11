Delimiter $$
Create Function f_emp_avg_salary(p_emp_no int) returns decimal(10,2)
deterministic
begin
	declare v_avg_salary Decimal(10,2);
	select avg(s.salary) into v_avg_salary
	from employees e 
	join salaries s on e.emp_no = s.emp_no
    where e.emp_no = p_emp_no;
    return v_avg_salary;
end$$
Delimiter ;

select f_emp_avg_salary(11300);


DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC
BEGIN
	DECLARE v_max_from_date date;
	DECLARE v_salary decimal(10,2);
    
	SELECT MAX(from_date) INTO v_max_from_date 
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
    
	SELECT s.salary INTO v_salary 
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.first_name = p_first_name AND e.last_name = p_last_name AND s.from_date = v_max_from_date;
	RETURN v_salary;
    END$$
DELIMITER ;



select emp_info('aruna','journel');