SELECT
	companion_full_name,
	email
FROM users
WHERE 
    companion_full_name LIKE '%aNd%'
	OR companion_full_name LIKE '%And%'
	OR companion_full_name LIKE '%anD%'
	OR companion_full_name LIKE '%aND%'
	OR companion_full_name LIKE '%AND%'
	OR companion_full_name LIKE '%and%'
	AND
email NOT LIKE '%@gmail'