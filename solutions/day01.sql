-- solutions/day01.sql
-- 1) Customers with order counts and total spend
WITH cust AS (
    SELECT c.customer_id, c.name
    FROM customers c
)
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS order_count,
    COALESCE(SUM(o.amount), 0) AS total_spend
FROM cust c
LEFT JOIN orders o
  ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spend DESC;

-- 2) Monthly GMV for 2025
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(amount) AS gmv
FROM orders
WHERE order_date >= DATE '2025-01-01'
  AND order_date <  DATE '2026-01-01'
GROUP BY 1
ORDER BY 1;

-- 3) Top 2 customers by spend
SELECT
    c.customer_id,
    c.name,
    SUM(o.amount) AS total_spend
FROM customers c
JOIN orders o
  ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spend DESC
LIMIT 2;
