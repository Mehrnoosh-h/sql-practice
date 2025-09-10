-- scripts/init.sql
-- Sample schema & seed data for practice

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT,
    signup_date DATE NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE NOT NULL,
    status TEXT CHECK (status IN ('placed','shipped','delivered','cancelled')),
    amount NUMERIC(10,2) NOT NULL
);

INSERT INTO customers (name, city, signup_date) VALUES
('Alice','Austin','2024-11-10'),
('Bob','Boston','2024-12-05'),
('Chloe','Chicago','2025-01-12'),
('Diego','Dallas','2025-02-03');

INSERT INTO orders (customer_id, order_date, status, amount) VALUES
(1,'2025-02-10','delivered',34.50),
(1,'2025-03-02','delivered',19.99),
(2,'2025-03-15','cancelled',12.00),
(2,'2025-04-01','shipped',45.25),
(3,'2025-04-10','placed',8.99),
(3,'2025-05-20','delivered',120.00),
(4,'2025-05-21','delivered',64.10),
(4,'2025-06-02','delivered',22.35);
