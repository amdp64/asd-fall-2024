DELIMITER //

CREATE PROCEDURE test()
BEGIN
	-- SQL Code goes here
    DECLARE invoice_count INT DEFAULT 0;
    SELECT COUNT(*) INTO invoice_count
    FROM invoices
    WHERE (invoice_total - payment_total - credit_total) >= 5000;
    -- Output the count
    SELECT CONCAT(invoice_count, ' invoices exceeed $5,000.') as message;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS test;
CALL test();