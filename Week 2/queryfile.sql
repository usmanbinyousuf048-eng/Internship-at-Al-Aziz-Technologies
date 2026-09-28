CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    age INT
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    products VARCHAR(100),
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers (customer_id, name, city, age) VALUES
(1, 'Ali Khan', 'Karachi', 22),
(2, 'Ahmed Raza', 'Lahore', 28),
(3, 'Sara Ahmed', 'Karachi', 25),
(4, 'Usman Malik', 'Islamabad', 31),
(5, 'Ayesha Noor', 'Lahore', 24),
(6, 'Hamza Ali', 'Karachi', 29),
(7, 'Fatima Sheikh', 'Multan', 27),
(8, 'Bilal Hussain', 'Islamabad', 23),
(9, 'Zainab Khan', 'Karachi', 34),
(10, 'Omar Farooq', 'Lahore', 30);
INSERT INTO orders (order_id, customer_id, products, amount) VALUES
(101, 1, 'Laptop', 85000),
(102, 2, 'Keyboard', 5000),
(103, 3, 'Monitor', 35000),
(104, 1, 'Mouse', 2500),
(105, 4, 'Laptop', 95000),
(106, 5, 'Headphones', 8000),
(107, 6, 'Monitor', 42000),
(108, 3, 'Keyboard', 6000),
(109, 7, 'Tablet', 55000),
(110, 8, 'Mouse', 3000),
(111, 9, 'Laptop', 110000),
(112, 2, 'Headphones', 7500),
(113, 10, 'Monitor', 38000),
(114, 6, 'Laptop', 90000),
(115, 4, 'Keyboard', 4500),
(116, 5, 'Tablet', 60000),
(117, 1, 'Headphones', 9000),
(118, 9, 'Monitor', 40000),
(119, 7, 'Laptop', 88000),
(120, 10, 'Mouse', 2800);

--ANALYTICAL QUERIES

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
--Show orders above Rs. 20,000
select * from orders where amount > 20000;
--Sort orders from highest to lowest amount
select * from orders order by amount desc;
--Show the 5 highest-value orders
select * from orders order by amount desc limit 5;
--Show first 5 customers
select * from customers LIMIT 5;
--Show customers older than 25 and sort them by age in descending order
select * from customers where age >25 order by age desc;