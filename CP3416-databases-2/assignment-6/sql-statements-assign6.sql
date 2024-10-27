-- Assignment 6
-- CP3416 Database Management Systems 2

-- Q1
CREATE VIEW customer_addresses AS
SELECT cust.customer_id, cust.email_address, cust.last_name, cust.first_name,
	   bill.line1 AS bill_line1, bill.line2 AS bill_line2, bill.city AS bill_city, bill.state AS bill_state, bill.zip_code AS bill_zip,
       ship.line1 AS ship_line1, ship.line2 AS ship_line2, ship.city AS ship_city, ship.state AS ship_state, ship.zip_code AS ship_zip
FROM customers cust, addresses bill, addresses ship
WHERE cust.billing_address_id = bill.address_id 
AND cust.shipping_address_id = ship.address_id;

SELECT * FROM customer_addresses;
-- DROP VIEW customer_addresses;

-- Q2
SELECT customer_id, last_name, first_name, bill_line1 
FROM customer_addresses
ORDER BY last_name, first_name;

-- Q3
UPDATE customer_addresses
SET ship_line1 = "1990 Westwood Blvd."
WHERE customer_id = 8;

-- Q4
CREATE VIEW order_item_products AS
SELECT ord.order_id, ord.order_date, ord.tax_amount, ord.ship_date,
	   prod.product_name, 
       ord_item.item_price, ord_item.discount_amount, (ord_item.item_price - ord_item.discount_amount) AS final_price, 
       ord_item.quantity, ((ord_item.item_price - ord_item.discount_amount) * ord_item.quantity) AS item_total
FROM orders ord
JOIN order_items ord_item ON ord.order_id = ord_item.order_id
JOIN products prod ON ord_item.product_id = prod.product_id;

SELECT * FROM order_item_products;
DROP VIEW order_item_products;

-- Q5
CREATE VIEW product_summary AS
SELECT oip.product_name, oip.quantity AS order_count,
	   ((oip.item_price - oip.discount_amount) * oip.quantity) AS order_total
FROM order_item_products oip;

SELECT * FROM product_summary;

-- Q6



