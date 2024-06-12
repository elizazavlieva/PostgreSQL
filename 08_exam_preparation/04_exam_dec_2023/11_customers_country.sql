CREATE OR REPLACE PROCEDURE 
		sp_customer_country_name(
			IN 	customer_full_name VARCHAR(50),
			OUT country_name VARCHAR(50)
		)
AS
$$
BEGIN
	 SELECT INTO country_name
		c.name
	FROM customers AS cm
	JOIN countries AS c
	ON c.id = cm.country_id
	WHERE 
        customer_full_name = CONCAT(cm.first_name, ' ', cm.last_name);

END;
$$
LANGUAGE plpgsql;