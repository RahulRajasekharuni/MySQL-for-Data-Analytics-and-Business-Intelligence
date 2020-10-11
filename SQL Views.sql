/* visualise the only period encompassing the last contract of each employee*/

CREATE OR REPLACE VIEW v_dept_emp_latest_date as
	select emp_no, MAX(from_date) as from_date, max(to_date) as to_date
	from dept_emp
	group by emp_no;

/#Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.#/
CREATE OR REPLACE VIEW v_avg_manager_salary as
	select round(avg(s.salary),2) as average_salary
	from salaries s
    join dept_manager dm on s.emp_no = dm.emp_no;