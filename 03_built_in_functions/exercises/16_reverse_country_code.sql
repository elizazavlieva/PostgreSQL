UPDATE countries
SET
 iso_code = LOWER(REVERSE(iso_code));