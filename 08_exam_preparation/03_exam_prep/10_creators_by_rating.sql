SELECT
	cr.last_name,
	CEIL(AVG(bg.rating)) AS average_rating,
	pb.name
FROM creators as cr
	JOIN 
        creators_board_games as cbg
	ON 
        cr.id = cbg.creator_id
	JOIN 
        board_games AS bg
	ON 
        bg.id = cbg.board_game_id
	JOIN 
        publishers AS pb
	ON 
        pb.id = bg.publisher_id
WHERE 
    pb.name = 'Stonemaier Games'
GROUP BY 
    pb.name, 
    cr.last_name
ORDER BY
	CEIL(AVG(bg.rating)) DESC;