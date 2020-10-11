use employees;

show fields from dept_emp;
show keys from dept_emp;

 SELECT `REFERENCED_TABLE_NAME` 
 FROM `information_schema`.`KEY_COLUMN_USAGE` 
 WHERE 
     `TABLE_NAME` = 'dept_emp' AND 
     `COLUMN_NAME` = 'emp_no';
     
show columns
from employees;


 SELECT * 
 FROM `information_schema`.`KEY_COLUMN_USAGE` 
 WHERE 
     `TABLE_NAME` = 'dept_emp' AND 
     `COLUMN_NAME` = 'emp_no';
    
show triggers;

/*information_schema is like a virtual database with views that bring up meta data information about your schema*/
select * from information_schema.tables;

create or replace view data_profiling_count_records as
SELECT  TABLE_SCHEMA, TABLE_NAME, TABLE_ROWS
FROM information_schema.tables
where TABLE_SCHEMA = 'employees' and TABLE_TYPE = 'BASE TABLE';

select * from information_schema.columns;

create or replace view data_profiling_information_schema as
SELECT  *
FROM information_schema.columns ic
where TABLE_SCHEMA = 'employees' and TABLE_NAME in (
	select TABLE_NAME 
	from information_schema.tables it 
	where ic.TABLE_NAME = it.TABLE_NAME and it.TABLE_TYPE = 'BASE TABLE');