ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL; 

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

ALTER TABLE employees.departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

SELECT * FROM    departments_dup ORDER BY dept_no ASC;

select dept_no, IFNULL(dept_name,'Department name not provided') as dept_name
from departments_dup;

select dept_no, coalesce(dept_name,'Department name not provided') as dept_name
from departments_dup;

select dept_no, dept_name, coalesce(dept_manager, dept_name, 'NA') as dept_manager
from departments_dup
order by dept_no asc;

update departments_dup set dept_name = null
where dept_no = 'd010';

select dept_no, dept_name, coalesce(dept_no, dept_name) as dept_info
from departments_dup;

select ifnull(dept_no, 'NA') as dept_no, ifnull(dept_name, 'department name not given') as dept_name 
from departments_dup;