CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT)
AS
$$
	BEGIN
	if (SELECT salary FROM  employees WHERE id = employee_id) IS NULL THEN
		RETURN;
	END IF;
	UPDATE employees SET salary = salary + (salary * 0.05) WHERE id = employee_id;
	COMMIT;
	END;
$$
LANGUAGE plpgsql;