-- Day 2 — Hands-on Tasks

-- Find customers older than 25.
select * from customers where age >25;
-- Find customers from Karachi or Lahore using IN.
select * from customers where city IN ('Karachi', 'Lahore');
-- Find customers aged between 25 and 30.
select * from customers where age BETWEEN 25 AND 30;

-- Find the total number of orders.
select count(*) from orders;
-- Find the total and average order amount.
select sum(amount) as total_amount, avg(amount) as average_amount from orders;
-- Find the highest order amount.
select max(amount) as highest_order from orders;

-- Find the number of customers in each city.
select city, count(*) as cust_count from customers group by city;
-- Find the total sales for each product.
select products, sum(amount) as total_sales from orders group by products;
-- Show only products with total sales above 100,000 using HAVING.
select products, sum(amount) as total_sales from orders group by products having sum(amount)>100000;

-- Create a sales category:
-- < 10,000 → Low
-- 10,000–50,000 → Medium
-- > 50,000 → High
select order_id,products,amount, CASE when amount<10000 then 'Low'
                             when amount BETWEEN 10000 and 50000 then 'medium'
                             when amount>50000 then 'High'
                             end as Sales_Category
                             from orders;
