CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(150),
	age INT
);

SELECT * FROM customers;

INSERT INTO customers (first_name, last_name, email, age)
VALUES ('Adnan','Waheed','a@b.com',40);
  