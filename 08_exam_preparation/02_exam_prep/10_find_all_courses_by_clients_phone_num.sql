CREATE OR REPLACE FUNCTION fn_courses_by_client(
							phone_num VARCHAR(20))
RETURNS INT AS

$$
	DECLARE 
		courses_count INT;
BEGIN
	SELECT INTO courses_count
		COUNT(*)
	FROM courses as c
	JOIN clients as cl
	ON c.client_id = cl.id
	WHERE cl.phone_number = phone_num;
	
	RETURN courses_count;
END;
$$
LANGUAGE plpgsql;