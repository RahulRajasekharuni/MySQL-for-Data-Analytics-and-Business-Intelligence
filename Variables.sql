#create the variable
set @v_avg_salary = 0;

#extract a value that will be assigned to the newly created variable (call the procedure)
call employees.emp_avg_salary_out(11300, @v_avg_salary);

#ask the software to dosplay the output of the procedure by selecting the variable we just created
select @v_avg_salary;

set @v_emp_no = 0;
call emp_info('aruna','journel',@v_emp_no);
select @v_emp_no;

#session variables
set @s_var1 = 3;

select @s_var1;

#global variables
set global max_connections = 1000;