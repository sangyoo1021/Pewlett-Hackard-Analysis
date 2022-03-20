-- Createt retiremet_title table.
SELECT e.emp_no, e.first_name, e.last_name,
t.title, t.from_date, t.to_date
INTO retirement_title
FROM employees as e
left JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, title;

SELECT * FROM retirement_title;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,first_name,
last_name,
title
INTO unique_title
FROM retirement_title
ORDER BY emp_no, title DESC;

SELECT * FROM unique_title;

--Counting number of titles from unique_title
SELECT COUNT(title)
FROM unique_title;

--Create retiring_title table 
SELECT count(title), title
into retiring_title
from unique_title
Group By title
order by count desc;

SELECT * FROM retiring_title;

--Create mentorship_eligibility table 
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
d.from_date, d.to_date, 
t.title
INTO mentorship_eligibility
FROM employees as e
left OUTER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
left OUTER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;


