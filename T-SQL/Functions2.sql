CREATE FUNCTION emp_info(@p_first_name varchar(255), @p_last_name varchar(255)) 
RETURNS decimal(10,2)
AS
BEGIN
	DECLARE @v_max_from_date date;
	DECLARE @v_salary decimal(10,2);
    
	SELECT @v_max_from_date = MAX(e.hire_date) 
    FROM employees e
    WHERE e.first_name = @p_first_name AND e.last_name = @p_last_name;
    
	SELECT @v_salary = salary 
    FROM employees e
    WHERE e.first_name = @p_first_name AND e.last_name = @p_last_name AND e.hire_date = @v_max_from_date;
	RETURN @v_salary;
END;

select * from employees;

select dbo.emp_info('steven','King');