SELECT
	c.id,
	c.make,
	c.mileage,
	COUNT(co.id) AS count_of_courses,
	ROUND(AVG(co.bill), 2) AS average_bill
FROM 
	cars AS c
LEFT JOIN courses as co
    ON co.car_id = c.id
GROUP BY c.id
HAVING 
    COUNT(co.id) != 2
ORDER BY 
	count_of_courses DESC,
	c.id;
