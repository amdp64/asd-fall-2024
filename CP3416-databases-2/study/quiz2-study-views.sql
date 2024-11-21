DROP VIEW IF EXISTS customers_addresses;

-- Q1

CREATE VIEW customers_addresses AS
SELECT c.customer_id, c.email_address, c.last_name, c.first_name,
	   a.line1 AS bill_line1, a.line2 AS bill_line2, a.city AS bill_city, a.state AS bill_state, a.zip_code AS bill_zip,
       b.line1 AS ship_line1, b.line2 AS ship_line2, b.city AS ship_city, b.state AS ship_state, b.zip_code AS ship_zip
FROM customers c
JOIN addresses a
JOIN addresses b
WHERE a.address_id = c.billing_address_id AND
	  b.address_id = c.shipping_address_id;
      
SELECT * FROM customers_addresses;

-- Q2
SELECT customer_id, last_name, first_name, bill_line1
FROM customers_addresses
ORDER BY last_name, first_name;

-- Q3
UPDATE customers_addresses
SET ship_line1 = '1990 Westwood Blvd'
WHERE customer_id = 8;

SELECT customer_id, last_name, first_name, ship_line1
FROM customers_addresses
ORDER BY last_name, first_name;

-- Q4
DROP VIEW IF EXISTS order_item_products;

CREATE VIEW order_item_products AS
SELECT o.order_id, o.order_date, o.tax_amount, o.ship_date,
	   p.product_name,
	   oi.item_price, oi.discount_amount, (oi.item_price - oi.discount_amount) AS final_price,
	   oi.quantity, ((oi.item_price - oi.discount_amount) * oi.quantity) AS item_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT * FROM order_item_products;

-- Q5
DROP VIEW IF EXISTS product_summary;

CREATE VIEW product_summary AS
SELECT product_name, SUM(quantity) AS order_count,
	   SUM(item_total) AS order_total
FROM order_item_products
GROUP BY product_name;

SELECT * FROM product_summary;

-- Q6
SELECT product_name, order_total
FROM product_summary
ORDER BY order_total DESC
LIMIT 5;

-- Redo

-- Q1
DROP VIEW IF EXISTS customer_addresses;

CREATE VIEW customer_addresses AS
SELECT c.customer_id, c.email_address, c.last_name, c.first_name,
	   a.line1 AS bill_line1, a.line2 AS bill_line2, a.city AS bill_city, a.state AS bill_state, a.zip_code AS bill_zip,
       b.line1 AS ship_line1, b.line2 AS ship_line2, b.city AS ship_city, b.state AS ship_state, b.zip_code AS ship_zip
FROM customers c
JOIN addresses a ON c.customer_id = a.customer_id
JOIN addresses b ON c.customer_id = b.customer_id
WHERE a.address_id = c.billing_address_id AND
	  b.address_id = c.shipping_address_id;

SELECT * FROM customer_addresses;

-- Q2
SELECT customer_id, last_name, first_name, bill_line1
FROM customer_addresses
ORDER BY last_name, first_name;

-- Q3
UPDATE customer_addresses
SET ship_line1 = '1990 Westwood Blvd.'
WHERE customer_id = 8;

-- Q4
DROP VIEW IF EXISTS order_item_products;

CREATE VIEW order_item_products AS
SELECT o.order_id, o.order_date, o.tax_amount, o.ship_date,
	   p.product_name,
       oi.item_price, oi.discount_amount, (oi.item_price - oi.discount_amount) AS final_price, oi.quantity, 
       ((oi.item_price - oi.discount_amount) * oi.quantity) AS item_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT * FROM order_item_products;

-- Q5
DROP VIEW IF EXISTS product_summary;

CREATE VIEW product_summary AS
SELECT product_name, SUM(quantity) AS order_count, SUM(item_total) AS order_total
FROM order_item_products
GROUP BY product_name;

SELECT * FROM product_summary;

-- Q6
SELECT product_name, order_total
FROM product_summary
ORDER BY order_total DESC
LIMIT 5;


