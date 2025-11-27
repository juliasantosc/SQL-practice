
--SQL Exercises: SELECT
  
-- 1. List all customers from the Customers table
SELECT * FROM customers;

-- 2. Show only the name and email of the customers
SELECT name, email FROM customers;

-- 3. List all products with price greater than 50
SELECT * FROM products WHERE price > 50;

-- 4. Show all orders made in 2024
SELECT * FROM orders WHERE YEAR(order_date) = 2024;

-- 5. List employees ordered by name
SELECT * FROM employees ORDER BY name ASC;
