UPDATE countries
SET country_name = 'Burma'
WHERE country_name = 'Myanmar';

INSERT INTO monasteries(monastery_name,country_code)
VALUES 
    ('Hanga Abbey','TZ'),
    ('Myin-Tin-Daik','MM');

SELECT
	ct.continent_name
	,cn.country_name
	,COUNT(m.monastery_name) AS monasteries_count
FROM countries AS cn
LEFT JOIN continents AS ct 
USING (continent_code)
LEFT JOIN monasteries AS m
USING (country_code)
WHERE
	cn.three_rivers = false
GROUP BY
	cn.country_name,ct.continent_name
ORDER BY
	monasteries_count DESC
	,cn.country_name ASC;