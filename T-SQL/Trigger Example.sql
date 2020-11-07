ALTER TRIGGER before_salaries_insert
ON employees
INSTEAD OF INSERT
AS
BEGIN
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
Select i.first_name, i.last_name, i.email, i.phone_number, i.hire_date,i.job_id,
case
	when i.salary < 0 then 0
	else i.salary
end as salarycheck,
i.manager_id,i.department_id
from inserted i
END;

