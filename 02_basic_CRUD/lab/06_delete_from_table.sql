DELETE FROM employees as e
WHERE e.department_id = 1 OR e.department_id = 2
;

SELECT *
FROM employees
ORDER BY id;