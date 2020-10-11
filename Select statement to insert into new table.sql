select * from dept_emp order by emp_no desc limit 10;

insert into dept_emp values(999903, 'd005','1997-10-01', '9999-01-01');

 create table departments_dup
 (
	dept_no char(4) NOT NULL,
    dept_name varchar(40) NOT NULL
);

insert into departments_dup(dept_no, dept_name)
select * from departments;

select * from departments_dup;
 

