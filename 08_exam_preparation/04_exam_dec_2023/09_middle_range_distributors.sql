SELECT
	d.name AS distributor_name,
	i.name AS ingredient_name,
	p.name AS product_name,
	AVG(fb.rate) AS average_rate
FROM distributors AS d
JOIN ingredients AS i
ON d.id = i.distributor_id
JOIN products_ingredients AS pi
ON i.id = pi.ingredient_id
JOIN products AS p
ON p.id = pi.product_id
JOIN feedbacks AS fb
ON p.id = fb.product_id

GROUP BY d.name, 
		i.name, 
		p.name
HAVING AVG(fb.rate) BETWEEN 5 AND 8
ORDER BY
	distributor_name,
	ingredient_name,
	product_name