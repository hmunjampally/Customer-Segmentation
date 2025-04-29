CREATE DATABASE mall_segmentation;
USE mall_segmentation;


CREATE TABLE sales_data(
invoice_no VARCHAR(20),
customer_id VARCHAR(20),
category VARCHAR(50),
quantity INT,
invoice_date DATE,
price DECIMAL(10,2),
shopping_mall VARCHAR(200)
);


CREATE TABLE customer_data (
    customer_id VARCHAR(30),
    gender VARCHAR(10),
    age INT,
    payment_method VARCHAR(20)
);


CREATE TABLE shopping_mall (
    shopping_mall VARCHAR(200),
    construction_year INT,
    area_sqm VARCHAR(20),
    location VARCHAR(200),
    store_count INT
);



SHOW VARIABLES LIKE 'secure_file_priv';


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_data.csv'
INTO TABLE customer_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/shopping_mall.csv'
INTO TABLE shopping_mall
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



UPDATE sales_data
SET shopping_mall = REPLACE(REPLACE(TRIM(shopping_mall), CHAR(13), ''), CHAR(10), '');