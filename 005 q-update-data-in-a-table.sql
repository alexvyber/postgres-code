SELECT * FROM customers;

UPDATE customers
SET email = 'a2@b.com'
WHERE customer_id = 1;

UPDATE customers
SET 
email = 'a2@b.com',
age = 30
WHERE customer_id = 1;

