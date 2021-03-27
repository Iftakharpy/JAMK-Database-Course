-- Insert data into customers
INSERT INTO customers(first_name, last_name, phone, email, city, street_address)
VALUES ('Iftakhar', 'Husan', '01757076657', 'iftakharhusan7@gmail.com', 'Sylhet', '36 Fazilchit, Subidbazar'),
	('Maruf', 'Hussain', '01783932829', 'maruf@yahoo.com', 'Dhaka', '32 Dhanmondi'),
    ('Kawsor', 'Ahmed', '01788399289', 'kawsor@hotmail.com', 'Dhaka', '22/A Dhanmondi'),
    ('Al', 'Ayan', '01729038942', 'ayan@gmail.com', 'Comilla', '83 Etimhall');
SELECT * FROM customers;


-- Insert data into sotres
INSERT INTO stores(store_name, city, zip_code, street_address, phone, email)
VALUES ('Steve GS A', 'Oulu', '3100', '92/A Oulu, Molu', '+4492938392092', 'info@stevegsa.com'),
	('Steve GS B', 'Vantaa', '3200', '12/B Vantaa, Kolu', '+4482937882901', 'info@stevegsb.com'),
    ('Steve GS C', 'Turku', '3300', '999/C Turku, Jolu', '+4473927402932', 'info@stevegsc.com'),
    ('Steve GS D', 'Helsinki', '3400', '82/D Helsinki, Folu', '+4472983472829', 'info@stevegsd.com');
SELECT * FROM stores;


-- Insert data into categories
INSERT INTO categories(category_name)
VALUES ('beverages'),
    ('bread and bakery'),
    ('canned food'),
    ('meat'),
    ('biscuits');
SELECT * FROM categories;


--Insert data into products
INSERT INTO products(store_id, category_id, product_name, price, quantity)
VALUES (1, 1, 'CocaCola 5 Liters', 300, 500),
	(1, 1, 'Sprite 5 Liters', 250, 400),
    (1, 1, 'Fanta 5 Liters', 200, 300),
    (1, 1, 'Beer', 500, 100);
SELECT * FROM products;


-- Insert data into orders
INSERT INTO orders(customer_id, pickup_date)
VALUES (1, '2021-03-31'),
    (1, '2021-03-30'),
    (1, '2021-04-01'),
	(2, '2021-04-23'),
    (3, '2021-04-05');
SELECT * FROM orders;


-- Insert data into 
INSERT INTO orders_has_products(order_id, product_id, quantity)
VALUES (1, 4, 10),
	(4, 3, 5),
    (5, 2, 20),
    (5, 1, 2),
    (6, 1, 10),
    (6, 2, 20),
    (5, 4, 20);
SELECT * FROM shop.orders_has_products;
