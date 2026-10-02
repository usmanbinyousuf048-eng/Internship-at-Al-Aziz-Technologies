------------------------Business Insight Queries------------------------

--All Business Insight Findigs are extracted using the below queries. 
--Product Peformance Analysis
SELECT
    products,
    COUNT(*) AS order_count,
    SUM(amount) AS total_sales,
    AVG(amount) AS average_sale
FROM orders
GROUP BY products
ORDER BY total_sales DESC;

--Customer Spending Analysis
SELECT
    customer_id,
    COUNT(*) AS order_count,
    SUM(amount) AS total_spending,
    AVG(amount) AS average_order
FROM orders
GROUP BY customer_id
ORDER BY total_spending DESC;

--Order Value Analysis
SELECT
    customer_id,
    order_id,
    amount,
    RANK() OVER(
        PARTITION BY customer_id
        ORDER BY amount DESC
    ) AS customer_rank
FROM orders;

--Sales Category Analysis
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

--High Value Customers

SELECT
    customer_id,
    order_id,
    amount,
    SUM(amount) OVER(
        PARTITION BY customer_id
    ) AS customer_total

FROM orders;

--Above Average Orders
SELECT
    order_id,
    customer_id,
    amount
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
)
ORDER BY amount DESC;

---------------------------Analytical Queries---------------------------
--Overall sales
SELECT
    COUNT(*) AS total_orders,
    SUM(amount) AS total_sales,
    AVG(amount) AS average_order,
    MIN(amount) AS smallest_order,
    MAX(amount) AS largest_order
FROM orders;

--Sales by product
SELECT
    products,
    COUNT(*) AS order_count,
    SUM(amount) AS total_sales,
    AVG(amount) AS average_sale
FROM orders
GROUP BY products
ORDER BY total_sales DESC;

--Customer spending
SELECT
    customer_id,
    COUNT(*) AS order_count,
    SUM(amount) AS total_spending,
    AVG(amount) AS average_order
FROM orders
GROUP BY customer_id
ORDER BY total_spending DESC;

--Sales by category
SELECT
    CASE
        WHEN amount < 10000 THEN 'Low'
        WHEN amount BETWEEN 10000 AND 50000 THEN 'Medium'
        ELSE 'High'
    END AS sales_category,
    COUNT(*) AS order_count,
    SUM(amount) AS total_sales
FROM orders
GROUP BY
    CASE
        WHEN amount < 10000 THEN 'Low'
        WHEN amount BETWEEN 10000 AND 50000 THEN 'Medium'
        ELSE 'High'
    END;

--CTE Analysis
WITH CustomerSales AS (
    SELECT
        customer_id,
        SUM(amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_spending
FROM CustomerSales
WHERE total_spending > 100000
ORDER BY total_spending DESC;
