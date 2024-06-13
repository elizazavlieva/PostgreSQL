UPDATE coaches AS c
SET salary = salary * coach_level
WHERE first_name LIKE 'C%'
	AND 
(SELECT
	COUNT(*)
	FROM players AS p
	JOIN players_coaches as pc
	ON p.id = pc.player_id
	join coaches AS c
	ON pc.coach_id = c.id
	WHERE c.id = pc.coach_id) > 1;