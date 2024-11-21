-- Q1

DROP PROCEDURE IF EXISTS exercise_1;

DELIMITER //

CREATE PROCEDURE exercise_1()
BEGIN 
	DECLARE product_count_var INT;
    
	SELECT COUNT(*) INTO product_count_var FROM products;
	IF product_count_var >= 7 THEN
		SELECT 'The number of products is greater than or equal to 7' AS message;
	ELSE
		SELECT 'The number of products is less than 7' AS message;
    END IF;
END//

DELIMITER ;

CALL exercise_1();

-- Q2
DROP PROCEDURE IF EXISTS exercise_2;

DELIMITER //

CREATE PROCEDURE exercise_2()
BEGIN
	DECLARE product_count_var INT;
    DECLARE average_list_price DECIMAL(9,2);
    
    SELECT COUNT(*) FROM products INTO product_count_var;
    SELECT AVG(list_price) FROM products INTO average_list_price;
    
    IF product_count_var >= 7 THEN
		SELECT product_count_var AS count,
			   average_list_price AS average_price;
	ELSE 
		SELECT 'The number of products is less than 7' AS message;
	END IF;
END//

DELIMITER ;

CALL exercise_2();

-- Q3
DROP PROCEDURE IF EXISTS exercise_3;

DELIMITER //

CREATE PROCEDURE exercise_3()
BEGIN
	DECLARE i				INT DEFAULT 1;
    DECLARE number_1_var 	INT DEFAULT 10;
    DECLARE number_2_var 	INT DEFAULT 20;
    DECLARE message_var			VARCHAR(255);
    
    SET message_var = CONCAT('Common factors of ', number_1_var, ' and ', number_2_var, ': ');
    WHILE ((i <= number_1_var) AND (i < number_2_var)) DO
		
        IF ((number_1_var % i = 0) AND (number_2_var % i = 0)) THEN
			SET message_var = CONCAT(message_var, i, ' ');
		END IF;
        
        SET i = i + 1;
	END WHILE;
        
	SELECT message_var AS message;
			
END//

DELIMITER ;

CALL exercise_3();

-- Q4
DROP PROCEDURE IF EXISTS exercise4;

DELIMITER //

CREATE PROCEDURE exercise4()
BEGIN
	DECLARE output_string VARCHAR(500) DEFAULT '';
    DECLARE row_not_found INT DEFAULT FALSE;
    DECLARE product_name_var VARCHAR(255);
    DECLARE list_price_var DECIMAL(9,2) DEFAULT 0;

	-- Declare the Cursor
    DECLARE product_cursor CURSOR FOR
		SELECT product_name, list_price
		FROM products
		WHERE list_price > 700
		ORDER BY list_price DESC;
        
	OPEN product_cursor;
    
    BEGIN 
    
		DECLARE CONTINUE HANDLER FOR NOT FOUND
			SET row_not_found = TRUE;
            
		WHILE TRUE DO
			FETCH product_cursor INTO product_name_var, list_price_var;
			SET output_string = CONCAT(output_string, '"', product_name_var, '","', list_price_var, '"|');
		END WHILE;
    
    END;
    
    CLOSE product_cursor;
    
	SELECT output_string AS message;
END//

DELIMITER ;

CALL exercise4;

-- Q5
DROP PROCEDURE IF EXISTS exercise5;

DELIMITER //

CREATE PROCEDURE exercise5()

BEGIN
	DECLARE insert_status INT DEFAULT FALSE;
    DECLARE output_message VARCHAR(255) DEFAULT '';

	DECLARE CONTINUE HANDLER FOR 1062
		SET insert_status = TRUE;
		
	INSERT INTO categories (category_id, category_name)
    VALUES (default, 'Guitars');
	
    IF insert_status = TRUE THEN
		SET output_message = 'Row was not inserted - duplicate entry';
	ELSE 
		SET output_message = '1 row was inserted';
	END IF;
	
    SELECT output_message AS message;
    
END//

DELIMITER ;

CALL exercise5;

-- Redo

-- Q4
DROP PROCEDURE IF EXISTS exercise5;

DELIMITER //

CREATE PROCEDURE exercise5() 
BEGIN
	DECLARE product_name_var VARCHAR(255);
    DECLARE list_price_var DECIMAL(9,2);
    DECLARE output_string TEXT DEFAULT '';
    DECLARE row_not_found INT DEFAULT FALSE;
    
    -- declare a cursor
    DECLARE product_cursor CURSOR FOR
		SELECT product_name, list_price
		FROM products
		WHERE list_price > 700
		ORDER BY list_price DESC;
        
	-- error handling
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET row_not_found = TRUE;
        
	-- open a cursor
	OPEN product_cursor;
    
	FETCH product_cursor INTO product_name_var, list_price_var;
	WHILE row_not_found = FALSE DO
		SET output_string = CONCAT(output_string, '"', product_name_var, '","', list_price_var, '"|');
        FETCH product_cursor INTO product_name_var, list_price_var;
	END WHILE;

	CLOSE product_cursor;
	
	SELECT output_string AS message;
    
END//

DELIMITER ;

CALL exercise5;


