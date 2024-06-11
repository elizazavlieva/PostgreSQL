CREATE  TABLE search_results(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	release_year INT,
	rating FLOAT,
	category_name VARCHAR(50),
	publisher_name VARCHAR(50),
	min_players VARCHAR(50),
	max_players VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE usp_search_by_category(
	category VARCHAR(50)
)
AS
$$
BEGIN
	TRUNCATE TABLE search_results;
	INSERT INTO search_results (
								name ,
								release_year,
								rating,
								category_name,
								publisher_name,
								min_players,
								max_players
		)
		SELECT
			bg.name,
			bg.release_year,
			bg.rating,
			ct.name,
			pb.name,
			CONCAT(pr.min_players, ' people') AS min_players,
           CONCAT(pr.max_players, ' people') AS max_players
		FROM board_games as bg
		JOIN players_ranges as pr
		ON bg.players_range_id = pr.id
		JOIN categories as ct
		ON  bg.category_id = ct.id
		JOIN publishers as pb
		ON pb.id = bg.publisher_id
	WHERE category = ct.name
	ORDER BY pb.name,
			bg.release_year DESC;
END;
$$
LANGUAGE plpgsql;
