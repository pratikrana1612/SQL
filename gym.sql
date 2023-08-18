CREATE DATABASE gym;
CREATE TABLE memberships (
    -- for mysql use this code
    -- id INT PRIMARY KEY AUTO_INCREMENT,
    -- for postgresql use this code
    -- id SERIAL PRIMARY KEY,
    membership_start DATE,
    membership_end DATE,
    last_checkin TIMESTAMP,
    last_checkout TIMESTAMP,
    consumption NUMERIC(5, 2),
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    price NUMERIC(5, 2),
    billing_frequency INT,
    gender VARCHAR(200)
);
INSERT INTO memberships (
        membership_start,
        membership_end,
        last_checkin,
        last_checkout,
        consumption,
        first_name,
        last_name,
        price,
        billing_frequency,
        gender
    )
VALUES (
        '2021-10-01',
        NULL,
        '2021-10-01 05:17:36',
        '2021-10-01 06:20:45',
        26.49,
        'Max',
        'Schwarz',
        19.99,
        12,
        'male'
    ),
    (
        '2020-05-10',
        '2022-05-09',
        '2021-11-03 10:01:56',
        '2021-11-03 14:30:00',
        100.26,
        'Manu',
        'Lorenz',
        199.99,
        1,
        'male'
    ),
    (
        '2021-02-18',
        '2022-02-17',
        '2021-10-29 15:26:05',
        '2021-10-29 17:01:33',
        5.10,
        'Julie',
        'Barnes',
        199.99,
        1,
        'female'
    );
INSERT INTO memberships (
        membership_start,
        membership_end,
        last_checkin,
        last_checkout,
        consumption,
        first_name,
        last_name,
        price,
        billing_frequency,
        gender
    )
VALUES (
        '2021-10-18',
        '2021-11-18',
        '2021-11-01 08:56:01',
        '2021-11-01 09:20:12',
        NULL,
        'John',
        'Doe',
        19.99,
        12,
        LOWER('DivErs')
    );
INSERT INTO memberships (
        membership_start,
        membership_end,
        last_checkin,
        last_checkout,
        consumption,
        first_name,
        last_name,
        price,
        billing_frequency,
        gender
    )
VALUES (
        '2021-05-02',
        NULL,
        '2021-06-05 11:52:25',
        '2021-06-05 11:58:08',
        NULL,
        'Monti',
        'Durns',
        199.99,
        1,
        TRIM(
            TRAILING ' '
            FROM 'male   '
        )
    );
SELECT SUM(price * billing_frequency)
FROM memberships
SELECT TRUNCATE(consumption, 0)
FROM memberships
SELECT CONCAT(first_name, ' ', last_name)
FROM memberships
SELECT CONCAT('$ ', price)
FROM memberships
SELECT LENGTH(gender)
FROM memberships
SELECT first_name
FROM memberships
WHERE LENGTH(first_name) < 4
SELECT EXTRACT(
        SECOND
        FROM last_checkout
    ),
    last_checkout
FROM memberships
SELECT WEEKDAY(last_checkout),
    last_checkout
FROM memberships
SELECT CONVERT(last_checkin, DATE),
    CONVERT(last_checkin, TIME)
FROM memberships
SELECT last_checkout - last_checkin
FROM memberships
SELECT TIMESTAMPDIFF(HOUR, last_checkin, last_checkout)
FROM memberships
SELECT DATEDIFF(NOW(), membership_start)
FROM memberships
SELECT NOW()
FROM memberships
SELECT DATE_ADD(membership_start, INTERVAL 7 DAY),
    membership_start
FROM memberships
SELECT first_name,
    first_name LIKE "%ax"
FROM memberships -- max
SELECT first_name,
    first_name LIKE "m%"
FROM memberships -- max,manu,monti
SELECT first_name,
    first_name LIKE "%m%"
FROM memberships -- max,manu,monti
SELECT first_name,
    first_name LIKE "_a%"
FROM memberships -- max,manu
SELECT first_name,
    first_name LIKE "__a%"
FROM memberships
SELECT first_name
FROM memberships
WHERE first_name LIKE 'J___' CREATE TABLE customers(
        -- for mysql use this code
        id INT PRIMARY KEY AUTO_INCREMENT,
        -- for postgresql use this code
        -- id SERIAL PRIMARY KEY,
        first_name VARCHAR(200),
        last_name VARCHAR(200),
        email VARCHAR(200)
    );
CREATE TABLE orders(
    -- for mysql use this code
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- for postgresql use this code
    -- id SERIAL PRIMARY KEY,
    amount_billed NUMERIC(5, 2),
    customer_id INT REFERENCES customers
);
INSERT INTO customers(first_name, last_name, email)
VALUES(
        'Max',
        'Schwarz',
        'max@test.com'
    ),
    (
        'Manu',
        'Lorenz',
        'manu@test.com'
    ),
    (
        'Julia',
        'Meyers',
        'juli@test.com'
    );
INSERT INTO orders(amount_billed, customer_id)
VALUES(48.99, 1),
    (27.45, 2),
    (19.49, 1),
    (8.49, 3);
SELECT EXISTS(
        SELECT first_name,
            last_name
        FROM customers
        WHERE email = 'max@test.com'
    )
SELECT o.id
FROM orders AS o
WHERE EXISTS(
        SELECT c.email
        FROM customers AS c
        WHERE o.customer_id = c.id
            AND c.email = 'max@test.com'
    ) --INNER JOIN customers AS c ON o.customer_id = c.id
    --WHERE c.email = 'max@test.com'
INSERT INTO customers(first_name, last_name, email)
VALUES(
        'Ken',
        'Brooks',
        'ken@test.com'
    );
SELECT DISTINCT email
FROM customers AS c
    INNER JOIN orders AS o ON c.id = o.customer_id
SELECT id
FROM customers
WHERE first_name NOT IN('Max', 'Manu')
SELECT email
FROM customers
WHERE id IN(
        SELECT customer_id
        FROM orders
    )
SELECT amount_billed,
    CASE
        WHEN amount_billed > 30 THEN 'GOOD DAY'
        WHEN amount_billed > 15 THEN 'NORMAL DAY'
        ELSE 'BAD DAY'
    END
FROM orders

SELECT weekday_nr,
    CASE
        WHEN weekday_nr = 0 THEN 'MONDAY'
        WHEN weekday_nr = 1 THEN 'THURSDAY'
        WHEN weekday_nr = 2 THEN 'WEDNESDAY'
        WHEN weekday_nr = 3 THEN 'TUESDAY'
        ELSE 'NO DAY'
    END
FROM (SELECT WEEKDAY(last_checkout) AS weekday_nr FROM memberships) AS t