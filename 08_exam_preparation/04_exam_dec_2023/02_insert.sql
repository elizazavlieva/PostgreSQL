-- Create the gift_recipients table
CREATE TABLE gift_recipients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    country_id INT,
    gift_sent BOOLEAN DEFAULT FALSE
);

-- Insert data into the gift_recipients table from the customers table
INSERT INTO gift_recipients (name, country_id, gift_sent)
SELECT 
    CONCAT(first_name, ' ', last_name) AS name,
    country_id,
    CASE 
        WHEN country_id IN (7, 8, 14, 17, 26) THEN TRUE 
        ELSE FALSE 
    END AS gift_sent
FROM 
    customers;
