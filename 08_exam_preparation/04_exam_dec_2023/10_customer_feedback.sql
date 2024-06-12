CREATE OR REPLACE FUNCTION fn_feedbacks_for_product(
	product_name VARCHAR(25)
) 
RETURNS TABLE (
	customer_id INT,
	customer_name VARCHAR(75),
	feedback_description VARCHAR(255),
	feedback_rate NUMERIC(4, 2)
) AS
$$
BEGIN
	RETURN QUERY
	SELECT 
		c.id,
		c.first_name,
		fb.description,
		fb.rate
	FROM products AS p
	JOIN feedbacks AS fb
	ON p.id = fb.product_id
	JOIN customers as c
	ON c.id = fb.customer_id
	WHERE p.name = product_name
	ORDER BY c.id;
		
END;
$$
LANGUAGE plpgsql;
