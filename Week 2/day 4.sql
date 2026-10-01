--Day 4 SQL Queries
--Task 1 — Row Number
SELECT
    order_id,
    amount,
    ROW_NUMBER() OVER(
        ORDER BY amount DESC
    ) AS row_num
FROM orders;
--Task 2 — Rank Orders
SELECT
    order_id,
    amount,
    RANK() OVER(
        ORDER BY amount DESC
    ) AS order_rank
FROM orders;
--Task 3 — Dense Rank
SELECT
    order_id,
    amount,
    DENSE_RANK() OVER(
        ORDER BY amount DESC
    ) AS dense_rank
FROM orders;
--Task 4 — Product Total Without GROUP BY
SELECT
    order_id,
    products,
    amount,
    SUM(amount) OVER(
        PARTITION BY products
    ) AS product_total
FROM orders;
--Task 5 — Rank Orders for Each Customer
SELECT
    customer_id,
    order_id,
    amount,
    RANK() OVER(
        PARTITION BY customer_id
        ORDER BY amount DESC
    ) AS customer_rank
FROM orders;
--Task 6 — Running Sales Total
SELECT
    order_id,
    amount,
    SUM(amount) OVER(
        ORDER BY order_id
    ) AS running_total
FROM orders;
--Task 7 — 3-Order Moving Average
SELECT
    order_id,
    amount,
    AVG(amount) OVER(
        ORDER BY order_id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average
FROM orders;
--Task 8 — High-Value Order Count
SELECT
    SUM(
        CASE
            WHEN amount > 50000 THEN 1
            ELSE 0
        END
    ) AS high_value_orders
FROM orders;
--Task 9 — Count Orders by Sales Category
SELECT
    SUM(CASE
        WHEN amount < 10000 THEN 1
        ELSE 0
    END) AS low_orders,

    SUM(CASE
        WHEN amount BETWEEN 10000 AND 50000 THEN 1
        ELSE 0
    END) AS medium_orders,

    SUM(CASE
        WHEN amount > 50000 THEN 1
        ELSE 0
    END) AS high_orders
FROM orders;
--Task 10 — Business Analysis Query
SELECT
    customer_id,
    order_id,
    amount,

    RANK() OVER(
        PARTITION BY customer_id
        ORDER BY amount DESC
    ) AS order_rank,

    SUM(amount) OVER(
        PARTITION BY customer_id
    ) AS customer_total

FROM orders;

--Reusable Analytical Queries: These can be reused by changing the table and column names as needed.

--Customer spending analysis
SELECT
    customer_id,
    SUM(amount) AS total_spending,
    AVG(amount) AS average_order
FROM orders
GROUP BY customer_id;

--Top orders
SELECT
    order_id,
    customer_id,
    amount,
    RANK() OVER(ORDER BY amount DESC) AS sales_rank
FROM orders;

--Product sales analysis
SELECT
    products,
    COUNT(*) AS order_count,
    SUM(amount) AS total_sales,
    AVG(amount) AS average_sale
FROM orders
GROUP BY products;