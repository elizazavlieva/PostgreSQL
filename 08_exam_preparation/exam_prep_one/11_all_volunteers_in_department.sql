CREATE OR REPLACE FUNCTION
fn_get_volunteers_count_from_department(
	searched_volunteers_department VARCHAR(30)
)
RETURNS INT
AS
$$
	DECLARE
		vol_count INT;
BEGIN
	SELECT
		COUNT(v.name) INTO vol_count
	FROM volunteers as v
		JOIN 
			volunteers_departments as vd
		ON 
			v.department_id = vd.id
	WHERE 
		vd.department_name = searched_volunteers_department;
	RETURN vol_count;
END;
$$
LANGUAGE plpgsql;