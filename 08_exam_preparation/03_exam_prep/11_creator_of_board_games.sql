CREATE OR REPLACE FUNCTION 
	fn_creator_with_board_games(
	cr_name VARCHAR(30)
	) 
RETURNS INT AS
$$
	DECLARE 
	count INT;
BEGIN
	SELECT INTO count
	 	COUNT(bg.id)
	FROM board_games as bg
	JOIN 
        creators_board_games as cbg
		on 
            bg.id = cbg.board_game_id
	JOIN 
        creators as cr
		ON 
            cbg.creator_id =cr.id
	WHERE 
        cr.first_name = cr_name;
	RETURN count;
END;
$$
LANGUAGE plpgsql;
