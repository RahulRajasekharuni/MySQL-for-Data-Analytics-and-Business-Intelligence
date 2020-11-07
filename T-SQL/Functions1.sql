Create Function f_emp_avg_salary(@p_emp_no int) 
returns decimal(10,2)
AS
begin
	declare @v_avg_salary Decimal(10,2);
	select @v_avg_salary = avg(e.salary)
	from employees e 
    where e.employee_id = @p_emp_no;
    return @v_avg_salary;
end;

select dbo.f_emp_avg_salary(100) as [test 1234 424];
