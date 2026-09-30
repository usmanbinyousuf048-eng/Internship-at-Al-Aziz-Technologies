--Day 3 Hands on Tasks
-- INNER JOIN: Show each customer's name, their order/product, and order amount.
select customers.name, orders.products, orders.Amount from customers inner join orders on customers.customer_id= orders.customer_id;

-- LEFT JOIN: Show all customers and their orders. Customers without orders should still appear.
select customers.name, orders.products, orders.Amount from customers left join orders on customers.customer_id= orders.customer_id;

-- Multi-table JOIN: Using customers, sales, and products, show:
-- Customer name
-- Product name
-- Quantity
-- Sale amount
SELECT
    customers.name,
    products.product_name,
    sales.quantity,
    sales.sale_amount
FROM customers
INNER JOIN sales
    ON customers.customer_id = sales.customer_id
INNER JOIN products
    ON sales.product_id = products.product_id;

--Find all orders where the amount is greater than the average order amount.
select * from orders where Amount>(select AVG(Amount) from orders);
--Find the names of customers who have made an order above 50,000.
select name from customers where customer_id in (select customer_id from orders where Amount>50000);
--Create a CTE containing orders above 50,000, then display those orders from the CTE.
WITH HighValueOrders AS (
    SELECT * FROM orders WHERE Amount > 50000
)
SELECT * FROM HighValueOrders;
-- Use UNION to combine the cities from customers with another compatible city result.
SELECT city FROM customers
UNION
SELECT city FROM customers WHERE age > 25;
-- Use UNION ALL to combine the same results and observe the difference.
SELECT city FROM customers
UNION ALL
SELECT city FROM customers WHERE age > 25;