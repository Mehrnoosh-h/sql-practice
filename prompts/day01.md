# Day 01 — Basic SELECTs & Aggregations

Using the `customers` and `orders` tables:
1) List all customers with their total number of orders and total amount spent.
2) Show monthly GMV (sum of `amount`) for 2025.
3) Top 2 customers by total spend.

**Hints**
- Try `LEFT JOIN` to include customers with zero orders.
- Use `DATE_TRUNC('month', order_date)` for monthly rollups.
