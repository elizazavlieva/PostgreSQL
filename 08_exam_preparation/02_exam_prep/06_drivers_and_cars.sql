SELECT
	d.first_name,
	d.last_name,
	c.make,
	c.model,
	c.mileage
FROM 
    drivers AS d
JOIN 
    cars_drivers as cd
        ON d.id = cd.driver_id
JOIN 
    carS as c
        ON cd.car_id = c.id
WHERE 
    c.mileage IS NOT NULL
ORDER BY 
	c.mileage DESC, 
	d.first_name;