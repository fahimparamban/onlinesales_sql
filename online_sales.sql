CREATE DATABASE sales_db;
USE sales_db;
CREATE TABLE online_sales (
    order_id VARCHAR(50),
    amount DECIMAL(10,2),
    profit DECIMAL(10,2),
    quantity INT,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    payment_mode VARCHAR(50)
);
USE sales_db;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Details.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, amount, profit, quantity, category, sub_category, payment_mode);
SELECT * FROM online_sales LIMIT 5;
ALTER TABLE online_sales ADD COLUMN order_date DATE;
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY 
    YEAR(order_date),
    MONTH(order_date)
ORDER BY 
    order_year, order_month;


