select salaries.*, employees.first_name
from salaries
join employees on salaries.emp_no = employees.emp_no
order by salary DESC
limit 10;