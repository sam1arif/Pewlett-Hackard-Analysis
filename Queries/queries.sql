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