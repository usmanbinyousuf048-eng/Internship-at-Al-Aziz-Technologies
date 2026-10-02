-- WEEK 2 SQL PROJECT

-- SECTION 1: BASIC QUERIES

--show all customers
select * from customers;
--show only customer names and cities
select name,city from customers;
--Find customers from Karachi
select * from customers where city='karachi';
--Find customers older than 25
select * from customers where age>25;
--Show all unique cities
select distinct city from customers;

-- SECTION 2: FILTERING

--Show the 5 highest-value orders
select * from orders order by amount desc limit 5;
--Show customers older than 25 and sort them by age in descending order
select * from customers where age >25 order by age desc;
-- Find customers from Karachi or Lahore using IN.
select * from customers where city IN ('Karachi', 'Lahore');
-- Find customers aged between 25 and 30.
select * from customers where age BETWEEN 25 AND 30;

-- SECTION 3: AGGREGATION

-- Find the total number of orders.
select count(*) from orders;
-- Find the total and average order amount.
select sum(amount) as total_amount, avg(amount) as average_amount from orders;
-- Find the highest order amount.
select max(amount) as highest_order from orders;


-- SECTION 4: GROUPING & HAVING

-- Find the number of customers in each city.
select city, count(*) as cust_count from customers group by city;
-- Find the total sales for each product.
select products, sum(amount) as total_sales from orders group by products;
-- Show only products with total sales above 100,000 using HAVING.
select products, sum(amount) as total_sales from orders group by products having sum(amount)>100000;


-- SECTION 5: CASE

-- Create a sales category:
-- < 10,000 → Low
-- 10,000–50,000 → Medium
-- > 50,000 → High
select order_id,products,amount, CASE when amount<10000 then 'Low'
                             when amount BETWEEN 10000 and 50000 then 'medium'
                             when amount>50000 then 'High'
                             end as Sales_Category
                             from orders;

-- SECTION 6: JOINS

-- INNER JOIN: Show each customer's name, their order/product, and order amount.
select customers.name, orders.products, orders.Amount from customers inner join orders on 
customers.customer_id= orders.customer_id;

-- LEFT JOIN: Show all customers and their orders. Customers without orders should still appear.
select customers.name, orders.products, orders.Amount from customers left join orders on 
customers.customer_id= orders.customer_id;

-- SECTION 7: SUBQUERIES

--Find all orders where the amount is greater than the average order amount.
select * from orders where Amount>(select AVG(Amount) from orders);
--Find the names of customers who have made an order above 50,000.
select name from customers where customer_id in (select customer_id from orders where Amount>50000);

-- SECTION 8: CTEs

--Create a CTE containing orders above 50,000, then display those orders from the CTE.
WITH HighValueOrders AS (
    SELECT * FROM orders WHERE Amount > 50000
)

-- SECTION 9: WINDOW FUNCTIONS

--Product Total Without GROUP BY
SELECT
    order_id,
    products,
    amount,
    SUM(amount) OVER(
        PARTITION BY products
    ) AS product_total
FROM orders;