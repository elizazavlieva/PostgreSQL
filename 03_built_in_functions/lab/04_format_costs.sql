SELECT
	title,
	trunc(cost, 3) as modified_price
FROM books
ORDER BY id;
