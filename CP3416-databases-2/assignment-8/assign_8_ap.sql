DELIMITER //

CREATE PROCEDURE insert_category(
	IN category_name VARCHAR(255)
)
BEGIN
	INSERT INTO categories(category_name)
	VALUES(category_name);
END//

CALL insert_category('Microphones');
CALL insert_category('Tambourines');