SELECT
	e.employee_id,
	CONCAT(e.first_name, ' ', e.last_name) AS full_name,
	ep.project_id,
	p.name AS project_name
FROM employees as e
JOIN employees_projects as ep
 USING (employee_id)
	JOIN projects as p
		ON ep.project_id = p.project_id
WHERE p.project_id = 1;