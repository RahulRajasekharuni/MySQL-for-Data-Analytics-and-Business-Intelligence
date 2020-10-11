select * from employees where emp_no = 999901;

insert into employees values (999901, '1990-12-31', 'Stella', 'Parkinson', 'F', '2011-01-01');

Update employees set first_name = 'Stella', last_name = 'Parkinson', birth_date = '1990-12-31', gender = 'F'
where emp_no = 999901;
