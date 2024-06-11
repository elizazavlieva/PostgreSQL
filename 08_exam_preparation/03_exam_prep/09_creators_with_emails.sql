SELECT
	CONCAT(cr.first_name, ' ', cr.last_name) as full_name,
	cr.email,
	MAX(bg.rating) AS rating
FROM creators as cr
	JOIN creators_board_games AS cbg
	ON  cr.id = cbg.creator_id
	JOIN board_games as bg
	on bg.id = cbg.board_game_id
WHERE 
    cr.email LIKE '%.com'
GROUP BY 
    cr.id
ORDER BY 
    full_name;
	