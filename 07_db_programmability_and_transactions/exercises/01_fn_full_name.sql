CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR(50), last_name VARCHAR(50))
RETURNS VARCHAR(100)
AS
$$
	BEGIN
		RETURN CONCAT(INITCAP(LOWER(first_name)), ' ', INITCAP(LOWER(last_name)));
	
	END;
$$

LANGUAGE plpgsql;