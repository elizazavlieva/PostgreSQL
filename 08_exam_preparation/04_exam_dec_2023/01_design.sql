CREATE TABLE countries(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE
	
);

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender CHAR(1) CHECK (gender IN ('F', 'M')),
	age INT NOT NULL CHECK (age > 0),
	phone_number CHAR(10) NOT NULL,
	country_id INT NOT NULL,

	CONSTRAINT fk_country
	FOREIGN KEY (country_id)
	REFERENCES countries(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(25) NOT NULL,
	description VARCHAR(250),
	recipe TEXT,
	price NUMERIC(10,2) NOT NULL CHECK(price > 0)
);

CREATE TABLE feedbacks(
	id SERIAL PRIMARY KEY,
	description VARCHAR(255), 
	rate NUMERIC(4,2) CHECK( RATE BETWEEN 0 AND 10),
	product_id INT NOT NULL,
	customer_id INT NOT NULL,

	CONSTRAINT fk_products
	FOREIGN KEY (product_id)
	REFERENCES products(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	CONSTRAINT fk_customers
	FOREIGN KEY (customer_id)
	REFERENCES customers(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
CREATE TABLE distributors(
	id SERIAL PRIMARY KEY,
	name VARCHAR(25) NOT NULL UNIQUE,
	address VARCHAR(30) NOT NULL,
	summary VARCHAR(200) NOT NULL,
	country_id INT NOT NULL,

	CONSTRAINT fk_country
	FOREIGN KEY (country_id)
	REFERENCES countries(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE ingredients(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	description VARCHAR(200),
	country_id INT NOT NULL,
	distributor_id INT NOT NULL,

	CONSTRAINT fk_country
	FOREIGN KEY (country_id)
	REFERENCES countries(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	CONSTRAINT fk_distributors
	FOREIGN KEY (distributor_id)
	REFERENCES distributors(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE products_ingredients (
	product_id INT,
	ingredient_id INT,

	CONSTRAINT fk_products
	FOREIGN KEY (product_id)
	REFERENCES products(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	CONSTRAINT fk_ingredient
	FOREIGN KEY (ingredient_id)
	REFERENCES ingredients(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
