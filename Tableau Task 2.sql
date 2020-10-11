/* compare the number of male manager to the number of female managers from different departments for each year, starting from 1990*/
select count(e.emp_no) as number_of_managers, e.gender, dm.dept_no, dm.from_date, d.dept_name
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no
where year(dm.from_date) >= 1990
group by dm.dept_no, e.gender;

#course solution
SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        employees
    GROUP BY calendar_year) e
        CROSS JOIN
    dept_manager dm
        JOIN
    departments d ON dm.dept_no = d.dept_no
        JOIN 
    employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;