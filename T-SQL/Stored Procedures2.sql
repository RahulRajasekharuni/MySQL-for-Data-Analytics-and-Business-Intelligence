/*Stored Procedure with input output*/
create procedure emp_avg_salary_out(@p_emp_no integer, @p_avg_salary decimal(10,2) OUTPUT)
AS
	select @p_avg_salary = avg(salary)
    from employees
    where employee_id = @p_emp_no;
GO;

/*Use Begin and end to run multiple statements in a batch*/
Begin
    DECLARE @avg_sal decimal(10,2);
    exec emp_avg_salary_out
    @p_emp_no = 200, @p_avg_salary = @avg_sal OUTPUT;
    select @avg_sal;
 End;



select * from employees;