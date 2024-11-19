SET GLOBAL event_scheduler = ON;
SHOW PROCESSLIST;

CREATE TABLE invoices_audit
(
vendor_id INT NOT NULL,
invoice_number VARCHAR(50) NOT NULL,
invoice_total DECIMAL(9,2) NOT NULL,
action_type VARCHAR(50) NOT NULL,
action_date DATETIME NOT NULL
);

DROP TABLE invoices_audit;

DELIMITER //

CREATE EVENT invoices_audit_insert
ON SCHEDULE EVERY 1 MINUTE
STARTS NOW()
DO BEGIN
	INSERT INTO invoices_audit
    VALUES (1, '123456', 100.00, 'INSERT', NOW());
END//

DELIMITER ;

SHOW EVENTS;
SELECT * FROM invoices_audit;

DROP EVENT invoices_audit_insert;
