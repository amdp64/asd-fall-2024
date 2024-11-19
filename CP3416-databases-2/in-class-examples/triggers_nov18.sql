-- Exercise 1 Page 490

DELIMITER //

CREATE TRIGGER invoices_before_update
  BEFORE UPDATE ON invoices
  FOR EACH ROW
BEGIN 
  DECLARE payment_plus_credit_totals DECIMAL(9,2);
  
  SELECT SUM(payment_total) + SUM(credit_total)
  INTO payment_plus_credit_totals
  FROM invoices
  WHERE invoice_id = NEW.invoice_id;
  
  IF payment_plus_credit_totals > NEW.invoice_total THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Payment plus credit total must not exceed invoice total.';
  END IF;
END //

-- Eric's solution
  IF 

DELIMITER ;

DROP TRIGGER IF EXISTS invoices_before_update;

UPDATE invoices
SET payment_total = 100.00,
	credit_total = 100.00
WHERE invoice_id = 100;



-- Exercise 2 Page 490

-- Create invoice_audit table

CREATE TABLE invoices_audit
(
  vendor_id			INT				NOT NULL,
  invoice_number	VARCHAR(50)		NOT NULL,
  invoice_total		DECIMAL(9,2)	NOT NULL,
  action_type		VARCHAR(50)		NOT NULL,
  action_date		DATETIME		NOT NULL
)

DROP TRIGGER IF EXISTS invoices_after_update;

DELIMITER //

CREATE TRIGGER invoices_after_update
  AFTER UPDATE ON invoices
  FOR EACH ROW
BEGIN
	INSERT INTO invoices_audit VALUES
    (OLD.vendor_id, OLD.invoice_number,
     OLD.invoice_total, 'UPDATE', NOW());
END //

DELIMITER ;

UPDATE invoices
SET terms_id = 1
WHERE invoice_id = 1;

SELECT * from invoices_audit;
