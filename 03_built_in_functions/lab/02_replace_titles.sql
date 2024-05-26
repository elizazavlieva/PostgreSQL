SELECT
	REPLACE(title, 'The', '***')
FROM books
WHERE SUBSTRING(title, 'The') = 'The'
ORDER BY id;