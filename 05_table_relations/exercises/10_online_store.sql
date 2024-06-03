CREATE TABLE item_types (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	item_type_name VARCHAR(100)
);

CREATE TABLE cities (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	city_name VARCHAR(50)
);

CREATE TABLE items (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	item_name VARCHAR(100),
	item_type_id INT,
	
	CONSTRAINT fk_item_type_id
	FOREIGN KEY (item_type_id)
	REFERENCES item_typeS(id)
);


CREATE TABLE customers(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	customer_name VARCHAR(100),
	birthday DATE,
	city_id INT,
	CONSTRAINT fk_city_id
	FOREIGN KEY (city_id)
	REFERENCES cities(id)
);

 CREATE TABLE orders (
	 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	 customer_id INT,
	 CONSTRAINT fk_customers_id
	 FOREIGN KEY (customer_id)
	 REFERENCES customers(id)
 );
CREATE TABLE order_items (
	order_id INT,

	CONSTRAINT fk_order_id
	FOREIGN KEY (order_id)
	REFERENCES orders(id),

	item_id INT,

	CONSTRAINT fk_item_id
	FOREIGN KEY (item_id)
	REFERENCES items(id),
	
	CONSTRAINT pk_order_items
	PRIMARY KEY (order_id, item_id)
);