UPDATE employees
SET salary = salary + 100
WHERE job_title = 'Manager'
;

SELECT 
	id,
	first_name,
	last_name,
	job_title,
	department_id,
	salary
FROM employees
WHERE job_title = 'Manager'
;