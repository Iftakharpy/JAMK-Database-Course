-- a)Select all groceries from the category of your choice.
select p.product_name, P.price 
 from products p, Categories C
 where p.category_id=c.category_id and c.Category_name='beverages';


-- b)Select groceries with first letter in the name being between A-M.
select product_name from products
where (left(product_name, 1)) between 'A' and 'M';



-- c)Select groceries that are missing theprice information.
select * from products where price is null;


-- d)Select customers who have made more than one online order.
select c.customer_id, orders, first_name, last_name 
from (select count(*) as orders, customer_id from orders group by customer_id having orders>1) as t
inner join customers as c on t.customer_id=c.customer_id; 


-- e)Create a receipt of one online order of your choice. Receipt should include customer name, order number, the order creation date and the pickup date for the order.
select c.first_name, c.last_name, o.order_id, o.order_date, o.pickup_date, p.product_name, p.price, od.quantity
from customers as c 
inner join orders as o on c.customer_id=o.customer_id
inner join orderdetails as od on o.order_id = od.order_id
inner join products as p on p.product_id=od.product_id
where o.order_id = 1;


-- f)Select all orders that have been made more than a weekago.
select * from orders 
where datediff(cast(now() as date), Cast(order_date as date))>7;


-- g)Show the storage count for all groceries in total for each grocery store (how many groceries are stored in each grocery stores storage).
select s.store_id, product_name , sum(quantity) from products as p
inner join stores as s on s.store_id = p.store_id
group by s.store_id;


-- h)Count the totalprice of all groceries within one customer order of yourchoice.
select o.order_id, sum(p.price*od.quantity) as total, od.quantity 
from orders as o
inner join orderdetails as od
	on od.order_id = o.order_id
inner join products as p
	on p.product_id = od.product_id
where od.order_id = 1;
