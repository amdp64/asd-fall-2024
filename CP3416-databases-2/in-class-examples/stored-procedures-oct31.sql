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

-- Eric's solution.

DELIMITER //

CREATE PROCEDURE exercise1()
BEGIN
	DECLARE num_invoices INT;

    DECLARE invoices_cursor CURSOR FOR
		SELECT COUNT(*) FROM invoices
        WHERE invoice_total - payment_total - credit_total >= 5000;
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		SELECT "SQLERROR occured, procedure exited.";
	
    OPEN invoices_cursor;
        
	FETCH invoices_cursor INTO num_invoices;
    
    SELECT CONCAT(num_invoices, " invoices exceeds $5,000.");
    
    CLOSE invoices_cursor;
END
//

DELIMITER ;

CALL exercise1();