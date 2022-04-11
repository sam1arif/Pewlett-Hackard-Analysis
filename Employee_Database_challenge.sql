-- Deliverable 1:

--Retirement Employees titles.
select e.emp_no, 
	   e.first_name, 
	   e.last_name,
	   tl.title,
	   tl.from_date,
	   tl.to_date
into retirement_titles
from employees as e
	inner join titles as tl
		on (e.emp_no = tl.emp_no)
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no desc;

--Removing duplicates.

select distinct on (emp_no) rt.emp_no,
				rt.first_name,
				rt.last_name,
				rt.title
	
into unique_titles	

from retirement_titles as rt
	where rt.to_date = ('9999-01-01')
order by rt.emp_no asc, rt.to_date desc;

--Retiring employees numbers.
select count (ut.title), ut.title
	into retiring_titles
from unique_titles as ut
group by ut.title
order by ut.count desc;

--Deliverable 2:

--Employees eligible for mentorship program.
select distinct on (emp_no) 
	   e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   tl.title
into mentorship_eligibility
from employees as e	
	inner join dept_emp as de
			on e.emp_no = de.emp_no
	inner join titles as tl
		on e.emp_no = tl.emp_no
where (de.to_date = '9999-01-01')
and (birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no;