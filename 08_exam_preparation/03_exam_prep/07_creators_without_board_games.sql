
SELECT
	c.id,
	CONCAT(c.first_name, ' ', c.last_name) AS creator_name,
	c.email
FROM creators as c
LEFT JOIN creators_board_games as cbg
ON cbg.creator_id = c.id
WHERE cbg.board_game_id IS NULL;