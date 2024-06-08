SELECT
	ad.name AS address,
	CASE
		WHEN EXTRACT(HOUR FROM co.start) BETWEEN 6 AND 20 THEN 'Day'
		ELSE 'Night'
	END AS day_time,
	
	co.bill,
	cl.full_name,
	c.make,
	c.model,
	cat.name AS category_name
FROM addresses as ad
	JOIN courses as co
	ON co.from_address_id = ad.id
JOIN clients as cl
	on cl.id = co.client_id
JOIN cars AS c
	ON co.car_id = c.id
JOIN categories as cat
	ON cat.id = c.category_id
ORDER BY 
	co.id;
	