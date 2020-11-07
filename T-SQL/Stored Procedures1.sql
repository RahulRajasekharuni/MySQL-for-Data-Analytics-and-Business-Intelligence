
create procedure select_employees
AS
	SELECT TOP 1000 * 
	from employees
GO;

exec select_employees;
