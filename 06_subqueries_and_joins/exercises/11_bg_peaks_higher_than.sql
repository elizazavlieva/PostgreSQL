SELECT
	mc.country_code,
	m.mountain_range,
	p.peak_name,
	p.elevation
FROM mountains_countries as mc
JOIN mountains as m
    ON  mc.mountain_id = m.id
    JOIN peaks as p
        ON m.id = p.mountain_id
WHERE p.elevation > 2835 
	AND
	mc.country_code = 'BG'
ORDER BY p.elevation DESC;
