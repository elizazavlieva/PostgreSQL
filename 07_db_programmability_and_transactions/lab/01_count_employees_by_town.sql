CREATE OR REPLACE FUNCTION 
fn_count_employees_by_town(VARCHAR(20))
RETURNS INT AS
$$
	DECLARE 
	town ALIAS FOR $1;
	count INT;

	BEGIN
	SELECT
		COUNT(*) INTO count
	FROM towns as t
		JOIN addresses as a
		    USING (town_id)
		        JOIN employees as e
		            USING (address_id)
	WHERE t.name = town;
		
	RETURN count;
		
	END;
$$
LANGUAGE plpgsql;

SELECT * FROM fn_count_employees_by_town('Sofia')