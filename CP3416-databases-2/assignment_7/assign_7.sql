# Assignment 7
# CP3416
# Andrew Payne

# Exercise 1
USE my_guitar_shop;

DROP PROCEDURE IF EXISTS exercise_1;

DELIMITER //

CREATE PROCEDURE exercise_1()
BEGIN
	DECLARE product_count_var INT;

	SELECT COUNT(*)
	INTO product_count_var
	FROM products;

	IF product_count_var >= 7 THEN
		SELECT 'The number of products is greater than or equal to 7' AS message;
	ELSE
		SELECT 'The number of products is less than 7' AS message;
	END IF;
END//

DELIMITER ;

# Exercise 2
USE my_guitar_shop;

DROP PROCEDURE IF EXISTS exercise_2;

DELIMITER //

CREATE PROCEDURE exercise_2()
BEGIN
	DECLARE product_count_var INT;
	DECLARE average_list_price_var DECIMAL (9, 2);

	SELECT COUNT(*), AVG(list_price)
	INTO product_count_var, average_list_price_var
	FROM products;

	IF product_count_var >= 7 THEN
		SELECT 'The number of products is greater than or equal to 7' AS message,
		average_list_price_var AS average_list_price;
	ELSE
		SELECT 'The number of products is less than 7' AS message;
	END IF;
END//

DELIMITER ;

# Exercise 3
DROP PROCEDURE IF EXISTS exercise_3;

DELIMITER //

CREATE PROCEDURE exercise_3()
BEGIN
	DECLARE counter INT DEFAULT 1;
    DECLARE divisor INT DEFAULT 0;
    DECLARE result TEXT;
    
    # Temporary table to hold factors
    CREATE TEMPORARY TABLE IF NOT EXISTS Factors (
		factor_id INT AUTO_INCREMENT PRIMARY KEY,
        factor_value INT
	);
    
    # While for 10
    WHILE counter < 10 DO
		IF (10 % divisor = 0 AND 20 % divisor = 0) THEN
			INSERT INTO Factors (factor_value) VALUES (divisor);
		END IF;
        
        SET divisor = divisor + 1;
        SET counter = counter + 1;
	END WHILE;
    
    SELECT GROUP_CONCAT(factor_value SEPARATOR ' ')
    INTO result
    FROM Factors;
    
    SELECT CONCAT('Common factors of 10 and 20: ', result) AS message;
    
    DROP TEMPORARY TABLE IF EXISTS Factors;
END//

DELIMITER ;

# Exercise 4
USE my_guitar_shop;

DROP PROCEDURE IF EXISTS exercise_4;

DELIMITER //

CREATE PROCEDURE exercise_4()
BEGIN
	DECLARE output_string VARCHAR(500) DEFAULT '';
    DECLARE product_name_var VARCHAR(100);
    DECLARE list_price_var DECIMAL(9,2);
    DECLARE row_not_found TINYINT DEFAULT FALSE;
    
    -- Declare cursor for selecting --
    DECLARE product_cursor CURSOR FOR
		SELECT product_name, list_price FROM products
        WHERE list_price > 700
        ORDER BY list_price DESC;
        
	OPEN product_cursor;
    
    BEGIN
		DECLARE EXIT HANDLER FOR NOT FOUND
			SET row_not_found = TRUE;
		
        WHILE row_not_found = FALSE DO
			FETCH product_cursor INTO product_name_var, list_price_var;
            SET output_string = CONCAT(output_string, '"', product_name_var, '"', ',', '"', list_price_var, '"', '|');
		END WHILE;
	END;
    
    CLOSE product_cursor;
    SELECT output_string AS message;
    
END//

DELIMITER ;

# Exercise 5
USE my_guitar_shop;

DROP PROCEDURE IF EXISTS exercise_5;

DELIMITER //

CREATE PROCEDURE exercise_5()
BEGIN
	DECLARE duplicate_entry_for_category TINYINT DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR 1062
		SET duplicate_entry_for_category = TRUE;
    
    INSERT INTO categories VALUES (5, 'Guitars');
    
    IF duplicate_entry_for_category = TRUE THEN
		SELECT 'Row was not inserted - duplicate entry.' AS message;
	ELSE
		SELECT '1 row was inserted.' AS message;
	END IF;
END//

DELIMITER ;

# Calls
CALL exercise_1();
CALL exercise_2();
CALL exercise_3();
CALL exercise_4();
CALL exercise_5();