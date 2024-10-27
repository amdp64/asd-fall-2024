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

