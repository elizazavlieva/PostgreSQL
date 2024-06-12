SELECT
	fb.product_id,
	fb.rate,
	fb.description,
	c.id AS customer_id,
	c.age,
	c.gender
FROM customers as c
JOIN feedbacks AS fb
ON  fb.customer_id = c.id

WHERE 
    fb.rate < 5.0 
    AND 
    (c.gender = 'F' AND c.age > 30)
ORDER BY 
    fb.product_id DESC;