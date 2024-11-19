-- Examples from textbook pg. 426-427

-- Exercise 2 

DELIMITER //

CREATE PROCEDURE exercise2()
BEGIN
	DECLARE invoice_count INT DEFAULT 0;
    DECLARE balances_due_sum DECIMAL(10, 2) DEFAULT 0;
    
    SELECT COUNT(*) INTO invoice_count
    FROM invoices
    WHERE (invoice_total - payment_total - credit_total) > 0;
    
    SELECT SUM(invoice_total - payment_total - credit_total) INTO balances_due_sum
    FROM invoices
    WHERE (invoice_total - payment_total - credit_total) > 0;
    -- Output
    IF balances_due_sum >= 30000 THEN
		SELECT invoice_count AS invoice_count_message, balances_due_sum AS balances_due_sum_message;
	ELSE
		SELECT 'Total balance due is less than $30,000.' AS message;
	END IF;
END //

DROP PROCEDURE IF EXISTS exercise2;
CALL exercise2();

-- Exercise 4
CREATE PROCEDURE exercise4()
BEGIN
	DECLARE output_string VARCHAR(500) DEFAULT '';
    DECLARE vendor_name_var VARCHAR(100);
    DECLARE invoice_number_var VARCHAR(50);
    DECLARE balance_due_var DECIMAL(10,2);
    DECLARE row_not_found INT DEFAULT FALSE;
    
    -- Declare the cursor for selecting
    DECLARE invoice_cursor CURSOR FOR
		SELECT v.vendor_name, i.invoice_number, (i.invoice_total - i.payment_total - i.credit_total)
		FROM invoices i
        JOIN vendors v ON i.vendor_id = v.vendor_id
        WHERE (i.invoice_total - i.payment_total - i.credit_total) >= 5000
        ORDER BY balance_due DESC;
	
    -- Bad spot for exit handler (no output if put here)
    -- DECLARE EXIT HANDLER FOR NOT FOUND
		-- SET row_not_found = TRUE;
        
    OPEN invoice_cursor;
    
    BEGIN
		
		DECLARE EXIT HANDLER FOR NOT FOUND
			SET row_not_found = TRUE;
    
		WHILE TRUE DO
			FETCH invoice_cursor INTO vendor_name_var, invoice_number_var, balance_due_var;
            SET output_string = CONCAT(output_string, "//", vendor_name_var, "|", invoice_number_var, "|", balance_due_var);
		END WHILE;
	END;

    CLOSE invoice_cursor;
    
    SELECT output_string AS message;
END //

DELIMITER ;
