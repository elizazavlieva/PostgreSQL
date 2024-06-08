SELECT 
	CONCAT_WS(' ', o.name, '-', a.name) AS "owners - animals",
	o.phone_number,
	c.id AS cage_id
	
FROM owners as o
JOIN 
	animals as a
	ON a.owner_id = o.id
JOIN 
	animal_types as at
	ON a.animal_type_id = at.id
JOIN 
	animals_cages AS ac 
	ON ac.animal_id = a.id
JOIN 
	cages AS c 
	ON ac.cage_id = c.id
WHERE 
	at.animal_type = 'Mammals'
ORDER BY 
	o.name, 
	a.name DESC;