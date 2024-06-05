SELECT
	a.name,
	a.country,
	DATE(b.booked_at) AS booked_date
FROM apartments AS a
LEFT JOIN 
bookings AS b
    ON a.booking_id = b.booking_id
LIMIT 10;