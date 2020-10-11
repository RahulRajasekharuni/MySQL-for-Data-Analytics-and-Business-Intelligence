select emp_no
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having count(from_date)>1
order by emp_no;

#Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.