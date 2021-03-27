-- a) Select all groceries from the category of your choice.
SELECT * FROM products AS p
INNER JOIN categories AS c ON p.category_id=c.category_id
WHERE category_name='beverages';


-- b) Select groceries with first letter in the name beingbetween A-M.
SELECT * FROM products AS p
WHERE LEFT(product_name, 1) BETWEEN 'A' AND 'M';


-- c) Select groceries that are missing theprice information.
SELECT * FROM products WHERE price IS NULL;


-- d) Select customers who have made more than one online order.
SELECT count(o.customer_id), c.*, o.* FROM orders AS o
INNER JOIN customers AS c ON c.customer_id=o.customer_id
GROUP BY c.customer_id;


-- e) Create a receipt of one online order of your choice.
--  Receipt should include customer name, order number, the order creation date and the pickup date for the order.
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date, o.pickup_date FROM customers AS c
INNER JOIN orders AS o ON c.customer_id=o.customer_id;


-- f) Select all orders that have been made more than a weekago.
SELECT * FROM orders as o
WHERE DATEDIFF(CAST(NOW() AS DATE), CAST(order_date AS DATE))>7;


-- g) Show the storage count for all groceries in total for each grocery store (how many groceries are stored in each grocery stores storage).
SELECT store_name, SUM(p.quantity) AS ITEMS FROM products AS p
INNER JOIN stores AS s ON s.store_id=p.store_id
GROUP BY s.store_id;


-- h) Count the totalprice of all groceries within one customer order of yourchoice.
SELECT o.order_id, c.customer_id, c.first_name, c.last_name, p.product_name, p.price, op.quantity, SUM(p.price*op.quantity) AS TOTAL 
    FROM products AS p
INNER JOIN orders_has_products AS op
	ON op.product_id=p.product_id
INNER JOIN orders AS o
	ON o.order_id=op.order_id
INNER JOIN customers AS c
	ON c.customer_id=o.customer_id
WHERE o.order_id = 1 -- Order ID
GROUP BY o.order_id;
