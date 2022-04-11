-- Finding employees born in 1952-1955
select first_name, last_name
from employees
where birth_date BETWEEN '1952-01-01' AND '1955-12-31'

--Create another query searching for only 1952 birth dates.
select first_name, last_name
from employees
where birth_date BETWEEN '1952-01-01' AND '1952-12-31'

--Searching for 1953, 1954 and 1955 birth dates.
select first_name, last_name
from employees
where birth_date BETWEEN '1953-01-01' AND '1953-12-31'

-- Retirement eligibility
select first_name, last_name
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- Number of employees retiring
select count(first_name)
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- Create new table and input the data into it.
select first_name, last_name
into retirement_info
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- Delete retirement_info table and recreate it with emp_no
drop table retirement_info;
-- Create new table for retiring employees
select emp_no, first_name, last_name
into retirement_info
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- Check the table
select * from retirement_info;


-- Joining departments and dept_manager tables.
select d.dept_name,
		dm.emp_no,
		dm.from_date,
		dm.to_date
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables.
select ri.emp_no,
		ri.first_name,
		ri.last_name,
		de.to_date
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no;

-- New table.
select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
into current_emp
from retirement_info as ri
    left join dept_emp as de
        on ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

select * from current_emp

-- Employee count by department number
select count(ce.emp_no), de.dept_no
into count_dept
from current_emp as ce
    left join dept_emp as de
        on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

--Employee information
select e.emp_no, e.first_name, 
	   e.last_name, gender,
	   s.salary,
	   de.to_date
into emp_info
from employees as e
    inner join salaries as s
        on (e.emp_no = s.emp_no)
    inner join dept_emp as de
        on (e.emp_no = de.emp_no)
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31')
and (de.to_date = '9999-01-01');

--Department info	
select ce.emp_no,
	   ce.first_name,
	   ce.last_name,
	   d.dept_name
into dept_info
from current_emp as ce
	inner join dept_emp as de
		on (ce.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no);


-- Sales department info.
select ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   d.dept_name
into sales_info
from retirement_info as ri
	inner join dept_emp as de
		on (ri.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no)
where d.dept_name = ('Sales');

-- Sales and development departments info.
select ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   d.dept_name
into sales_dev_info
from retirement_info as ri
	inner join dept_emp as de
		on (ri.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no)
where d.dept_name in ('Sales', 'Development');