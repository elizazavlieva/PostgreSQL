ALTER TABLE countries_rivers
ADD CONSTRAINT fk_river_id
FOREIGN KEY (river_id)
REFERENCES rivers(id)
ON UPDATE CASCADE,

ADD CONSTRAINT fk_country_code
FOREIGN KEY (country_code)
REFERENCES countries(country_code)
ON UPDATE CASCADE;