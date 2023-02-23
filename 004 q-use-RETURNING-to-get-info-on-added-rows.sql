INSERT INTO customers (first_name)
VALUES ('ADAM');

INSERT INTO customers (first_name)
VALUES ('JOSEPH') RETURNING *;

INSERT INTO customers (first_name)
VALUES ('JOSEPH1') RETURNING customer_id;

SELECT * FROM customers;
 