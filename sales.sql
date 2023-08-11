CREATE DATABASE sales;
CREATE TABLE sales(
    -- id SERIAL PRIMARY KEY,
    id INT PRIMARY KEY AUTO_INCREMENT,
    date_created DATE DEFAULT (CURRENT_DATE),
    date_fulfilled DATE,
    customer_name VARCHAR(300) NOT NULL,
    product_name VARCHAR(300) NOT NULL,
    volume NUMERIC(10, 3) NOT NULL CHECK(volume >= 0),
    is_recurring BOOLEAN DEFAULT FALSE,
    is_disputed BOOLEAN DEFAULT FALSE
) 

-- UPDATE sales SET product_name='Truck',volume=109000.0 WHERE id=10;
-- DELETE FROM sales WHERE id=10;

SELECT *
FROM sales
WHERE volume > 1000;

SELECT *
FROM sales
ORDER BY volume DESC
LIMIT 10;

SELECT *
FROM sales
ORDER BY volume
LIMIT 10;

SELECT *
FROM sales
WHERE is_recurring IS TRUE;

SELECT *
FROM sales
WHERE is_disputed IS TRUE
    AND volume > 4000;

SELECT *
FROM sales
WHERE date_created > '2021-02-01'
    AND date_created < '2022-02-01';
    
SELECT *
FROM sales
WHERE date_created BETWEEN '2021-02-01' AND '2022-02-01';

SELECT *
FROM sales
WHERE (date_fulfilled - date_created) <= 5

-- WITH TIMESTAMP
-- SELECT *
-- FROM sales
-- WHERE EXTRACT(DAYS FROM date_fulfilled - date_created) <= 5


SELECT DISTINCT customer_name FROM sales;
SELECT DISTINCT product_name FROM sales;