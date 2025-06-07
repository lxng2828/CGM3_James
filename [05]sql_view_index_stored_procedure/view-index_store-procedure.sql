CREATE DATABASE IF NOT EXISTS demo;
USE demo;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(100) NOT NULL,
    productPrice DECIMAL(10,2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus VARCHAR(20) NOT NULL
);

INSERT INTO products (productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUES
('P001', 'Laptop X', 1200.00, 10, 'High-end laptop', 'Available'),
('P002', 'Phone Y', 800.00, 25, 'Smartphone', 'Available'),
('P003', 'Tablet Z', 500.00, 15, 'Android tablet', 'Out of Stock'),
('P004', 'Laptop X', 1250.00, 5, 'Slightly newer model', 'Available');

CREATE UNIQUE INDEX idx_product_code ON products(productCode);
CREATE INDEX idx_product_name_price ON products(productName, productPrice);

EXPLAIN SELECT * FROM products WHERE productCode = 'P001';
EXPLAIN SELECT * FROM products WHERE productName = 'Laptop X' AND productPrice = 1200.00;

CREATE VIEW view_products AS
SELECT productCode, productName, productPrice, productStatus FROM products;

ALTER VIEW view_products AS
SELECT productCode, productName, productPrice, productStatus FROM products WHERE productStatus = 'Available';

DROP VIEW IF EXISTS view_products;

DROP PROCEDURE IF EXISTS get_all_products;
DELIMITER //
CREATE PROCEDURE get_all_products()
BEGIN
    SELECT * FROM products;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS add_product;
DELIMITER //
CREATE PROCEDURE add_product(
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_desc TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    INSERT INTO products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_code, p_name, p_price, p_amount, p_desc, p_status);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS update_product_by_id;
DELIMITER //
CREATE PROCEDURE update_product_by_id(
    IN p_id INT,
    IN p_code VARCHAR(50),
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_amount INT,
    IN p_desc TEXT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE products
    SET productCode = p_code,
        productName = p_name,
        productPrice = p_price,
        productAmount = p_amount,
        productDescription = p_desc,
        productStatus = p_status
    WHERE id = p_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_product_by_id;
DELIMITER //
CREATE PROCEDURE delete_product_by_id(IN p_id INT)
BEGIN
    DELETE FROM products WHERE id = p_id;
END //
DELIMITER ;
