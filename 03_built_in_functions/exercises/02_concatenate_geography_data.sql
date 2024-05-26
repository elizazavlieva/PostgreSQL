CREATE VIEW view_continents_countries_currencies_details
	AS
SELECT
	CONCAT(
	cont.continent_name, ': ', cont.continent_code
	) AS continent_details,

	CONCAT_WS(
	' - ', count.country_name, count.capital, count.area_in_sq_km, 'km2'
	) AS country_information,
	
	CONCAT(
	curr.description, ' (', curr.currency_code, ')'
	) AS currencies
	
FROM 
	continents AS cont, 
	countries AS "count",
	currencies AS curr
WHERE
	cont.continent_code = count.continent_code
		AND
	count.currency_code = curr.currency_code

ORDER BY 
	country_information, currencies;
